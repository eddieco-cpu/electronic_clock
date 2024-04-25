# 使用 Node.js 18.14.0 官方映像作為基礎
FROM node:18.14.0

# 設定工作目錄。 create app directory (!! 創造的同時，也會進入到 app 目錄下)
WORKDIR /app

# 複製 package.json 和 package-lock.json（如果存在）
# 優先複製 package*.json，目的為 docker 內部安裝 node_modules
COPY package*.json ./

# ---- check 1. ---->
RUN echo "After copying package.json files:"
RUN ls -al

# 安裝專案依賴項
RUN npm install

# ---- check 2. ---->
RUN echo "After running npm install"
RUN ls -al

# 複製專案的其餘部分到工作目錄  # .dockerignore 忽略了外部的 node_modules
COPY . .

# ---- check 3. ---->
RUN echo "After copying the rest of the app"
RUN ls -al

# 應用會綁定到哪個埠 (in docker)。這裡使用 3006 (need to be the same as in app.js)
EXPOSE 3006

# 定義運行應用程式的命令
CMD ["npm", "start"]

############################################
# 啟動指令

# build image：
# docker build -t myclock:1.0 .

# run container：
# docker run -p 3003:3006 -d myclock:1.0
# docker run -d -p 3003:3006 --name myclock-container myclock:1.0