# 專案註記

---

- node.js (18)
- express
- docker

# Dockerfile 筆記

---

## image build 指令

#### shell script

```shell
docker build -t myclock:1.0 .
```

#### 筆記

- `-t 您的映像名稱:標籤` 這部分指定了映像的名稱和標籤，標籤是可選的，但是通常用於版本控制。如果不指定標籤，預設會使用 `latest`。

- 最後的 `.` 指的是 Dockerfile 的位置，這裡假設您在 Dockerfile 所在的目錄下運行此命令。

## runtime 指令

#### shell script

```shell
docker run -d -p 3003:3006 --name myclock-container myclock:1.0
```

#### 筆記

- `-d` 表示後臺運行容器。
- `-p 本地埠:容器埠` 映射容器埠到您的主機埠，允許外部訪問。
- `--name 容器名稱` 為運行的容器指定一個名稱，方便管理。
- `您的映像名稱:標籤` 指定要運行的映像名稱和標籤。

## port

#### 筆記

1. 專案本身的 port 起在 3006

```js
app.listen(3006, () => {
  console.log("express server running at http://127.0.0.1:3006", "\n");
});
```

2. Dockerfile 裡面的 port 設定 (同專案本身的 port)

```Dockerfile
EXPOSE 3006
```

3. docker run 時的 port (外部訪問多少: 3003) (將 docker && 專案本身的 port:3006 映射到，外部 port:3003)

```shell
docker run -d -p 3003:3006 --name myclock-container myclock:1.0
```
