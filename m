Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9CB35C304
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 12:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242861AbhDLJyQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 05:54:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:35910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242535AbhDLJu0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 05:50:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B9E946121D;
        Mon, 12 Apr 2021 09:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618220889;
        bh=qH6RsnGB4PDDNzXXr47X0/dM/gcjFWxfgFnN1I531nI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SEVcCsINLs1J8bYIBs8FkhzPtTkdwFr3Po4G+wNVcE+HxtzfaUFG98uG5JfQO4Z98
         XeGTTIZ/hmWJOP1XHouXg0nedTlKzYkxR17zrofx/WsBSjr5wk4ET1TJWPUp7Zzu0I
         CxcsEBpxY8YnaVwAzWX9UQrXLJUyDJzo7UvojfPgQMjAkUEoUevTABMwIryVoqEMdv
         7DE+x/6M85fhpSkGriyflM9+xoLxdIV0DMNX/T+2jKebhYo2TPh1q4oZAXEeFesm4c
         tj0iwyA+CjgcpRPeQaU3kwx1RRZUxGyt9P74NvT2C8uB1Y6Pg3/E6IigWLpUjHNW8T
         vVVJEDitXSEhg==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lVtAp-0000GM-5W; Mon, 12 Apr 2021 11:48:03 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 04/10] USB: serial: io_ti: use kernel types consistently
Date:   Mon, 12 Apr 2021 11:47:32 +0200
Message-Id: <20210412094738.944-5-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210412094738.944-1-johan@kernel.org>
References: <20210412094738.944-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use kernel types consistently by replacing the remaining __uXX types.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/io_ti.c | 110 ++++++++++++++++++-------------------
 drivers/usb/serial/io_ti.h |  32 +++++------
 2 files changed, 71 insertions(+), 71 deletions(-)

diff --git a/drivers/usb/serial/io_ti.c b/drivers/usb/serial/io_ti.c
index 480a73aff78f..b2e41ddd757e 100644
--- a/drivers/usb/serial/io_ti.c
+++ b/drivers/usb/serial/io_ti.c
@@ -64,7 +64,7 @@
 /* Product information read from the Edgeport */
 struct product_info {
 	int	TiMode;			/* Current TI Mode  */
-	__u8	hardware_type;		/* Type of hardware */
+	u8	hardware_type;		/* Type of hardware */
 } __attribute__((packed));
 
 /*
@@ -87,13 +87,13 @@ struct edgeport_fw_hdr {
 } __packed;
 
 struct edgeport_port {
-	__u16 uart_base;
-	__u16 dma_address;
-	__u8 shadow_msr;
-	__u8 shadow_mcr;
-	__u8 shadow_lsr;
-	__u8 lsr_mask;
-	__u32 ump_read_timeout;		/*
+	u16 uart_base;
+	u16 dma_address;
+	u8 shadow_msr;
+	u8 shadow_mcr;
+	u8 shadow_lsr;
+	u8 lsr_mask;
+	u32 ump_read_timeout;		/*
 					 * Number of milliseconds the UMP will
 					 * wait without data before completing
 					 * a read short
@@ -104,7 +104,7 @@ struct edgeport_port {
 
 	struct edgeport_serial	*edge_serial;
 	struct usb_serial_port	*port;
-	__u8 bUartMode;		/* Port type, 0: RS232, etc. */
+	u8 bUartMode;		/* Port type, 0: RS232, etc. */
 	spinlock_t ep_lock;
 	int ep_read_urb_state;
 	int ep_write_urb_in_use;
@@ -301,7 +301,7 @@ static int send_port_cmd(struct usb_serial_port *port, u8 command, u16 value,
 }
 
 /* clear tx/rx buffers and fifo in TI UMP */
-static int purge_port(struct usb_serial_port *port, __u16 mask)
+static int purge_port(struct usb_serial_port *port, u16 mask)
 {
 	int port_number = port->port_number;
 
@@ -319,10 +319,10 @@ static int purge_port(struct usb_serial_port *port, __u16 mask)
  * @buffer: pointer to input data buffer
  */
 static int read_download_mem(struct usb_device *dev, int start_address,
-				int length, __u8 address_type, __u8 *buffer)
+				int length, u8 address_type, u8 *buffer)
 {
 	int status = 0;
-	__u8 read_length;
+	u8 read_length;
 	u16 be_start_address;
 
 	dev_dbg(&dev->dev, "%s - @ %x for %d\n", __func__, start_address, length);
@@ -335,7 +335,7 @@ static int read_download_mem(struct usb_device *dev, int start_address,
 		if (length > 64)
 			read_length = 64;
 		else
-			read_length = (__u8)length;
+			read_length = (u8)length;
 
 		if (read_length > 1) {
 			dev_dbg(&dev->dev, "%s - @ %x for %d\n", __func__, start_address, read_length);
@@ -346,7 +346,7 @@ static int read_download_mem(struct usb_device *dev, int start_address,
 		 */
 		be_start_address = swab16((u16)start_address);
 		status = ti_vread_sync(dev, UMPC_MEMORY_READ,
-					(__u16)address_type,
+					(u16)address_type,
 					be_start_address,
 					buffer, read_length);
 
@@ -368,7 +368,7 @@ static int read_download_mem(struct usb_device *dev, int start_address,
 }
 
 static int read_ram(struct usb_device *dev, int start_address,
-						int length, __u8 *buffer)
+						int length, u8 *buffer)
 {
 	return read_download_mem(dev, start_address, length,
 					DTK_ADDR_SPACE_XDATA, buffer);
@@ -376,7 +376,7 @@ static int read_ram(struct usb_device *dev, int start_address,
 
 /* Read edgeport memory to a given block */
 static int read_boot_mem(struct edgeport_serial *serial,
-				int start_address, int length, __u8 *buffer)
+				int start_address, int length, u8 *buffer)
 {
 	int status = 0;
 	int i;
@@ -384,7 +384,7 @@ static int read_boot_mem(struct edgeport_serial *serial,
 	for (i = 0; i < length; i++) {
 		status = ti_vread_sync(serial->serial->dev,
 				UMPC_MEMORY_READ, serial->TI_I2C_Type,
-				(__u16)(start_address+i), &buffer[i], 0x01);
+				(u16)(start_address+i), &buffer[i], 0x01);
 		if (status) {
 			dev_dbg(&serial->serial->dev->dev, "%s - ERROR %x\n", __func__, status);
 			return status;
@@ -402,7 +402,7 @@ static int read_boot_mem(struct edgeport_serial *serial,
 
 /* Write given block to TI EPROM memory */
 static int write_boot_mem(struct edgeport_serial *serial,
-				int start_address, int length, __u8 *buffer)
+				int start_address, int length, u8 *buffer)
 {
 	int status = 0;
 	int i;
@@ -436,7 +436,7 @@ static int write_boot_mem(struct edgeport_serial *serial,
 
 /* Write edgeport I2C memory to TI chip	*/
 static int write_i2c_mem(struct edgeport_serial *serial,
-		int start_address, int length, __u8 address_type, __u8 *buffer)
+		int start_address, int length, u8 address_type, u8 *buffer)
 {
 	struct device *dev = &serial->serial->dev->dev;
 	int status = 0;
@@ -522,7 +522,7 @@ static int tx_active(struct edgeport_port *port)
 {
 	int status;
 	struct out_endpoint_desc_block *oedb;
-	__u8 *lsr;
+	u8 *lsr;
 	int bytes_left = 0;
 
 	oedb = kmalloc(sizeof(*oedb), GFP_KERNEL);
@@ -593,7 +593,7 @@ static int choose_config(struct usb_device *dev)
 }
 
 static int read_rom(struct edgeport_serial *serial,
-				int start_address, int length, __u8 *buffer)
+				int start_address, int length, u8 *buffer)
 {
 	int status;
 
@@ -611,7 +611,7 @@ static int read_rom(struct edgeport_serial *serial,
 }
 
 static int write_rom(struct edgeport_serial *serial, int start_address,
-						int length, __u8 *buffer)
+						int length, u8 *buffer)
 {
 	if (serial->product_info.TiMode == TI_MODE_BOOT)
 		return write_boot_mem(serial, start_address, length,
@@ -636,7 +636,7 @@ static int get_descriptor_addr(struct edgeport_serial *serial,
 		status = read_rom(serial,
 				   start_address,
 				   sizeof(struct ti_i2c_desc),
-				   (__u8 *)rom_desc);
+				   (u8 *)rom_desc);
 		if (status)
 			return 0;
 
@@ -652,13 +652,13 @@ static int get_descriptor_addr(struct edgeport_serial *serial,
 }
 
 /* Validate descriptor checksum */
-static int valid_csum(struct ti_i2c_desc *rom_desc, __u8 *buffer)
+static int valid_csum(struct ti_i2c_desc *rom_desc, u8 *buffer)
 {
-	__u16 i;
-	__u8 cs = 0;
+	u16 i;
+	u8 cs = 0;
 
 	for (i = 0; i < le16_to_cpu(rom_desc->Size); i++)
-		cs = (__u8)(cs + buffer[i]);
+		cs = (u8)(cs + buffer[i]);
 
 	if (cs != rom_desc->CheckSum) {
 		pr_debug("%s - Mismatch %x - %x", __func__, rom_desc->CheckSum, cs);
@@ -674,8 +674,8 @@ static int check_i2c_image(struct edgeport_serial *serial)
 	int status = 0;
 	struct ti_i2c_desc *rom_desc;
 	int start_address = 2;
-	__u8 *buffer;
-	__u16 ttype;
+	u8 *buffer;
+	u16 ttype;
 
 	rom_desc = kmalloc(sizeof(*rom_desc), GFP_KERNEL);
 	if (!rom_desc)
@@ -703,7 +703,7 @@ static int check_i2c_image(struct edgeport_serial *serial)
 		status = read_rom(serial,
 				start_address,
 				sizeof(struct ti_i2c_desc),
-				(__u8 *)rom_desc);
+				(u8 *)rom_desc);
 		if (status)
 			break;
 
@@ -748,7 +748,7 @@ static int check_i2c_image(struct edgeport_serial *serial)
 	return status;
 }
 
-static int get_manuf_info(struct edgeport_serial *serial, __u8 *buffer)
+static int get_manuf_info(struct edgeport_serial *serial, u8 *buffer)
 {
 	int status;
 	int start_address;
@@ -793,10 +793,10 @@ static int get_manuf_info(struct edgeport_serial *serial, __u8 *buffer)
 /* Build firmware header used for firmware update */
 static int build_i2c_fw_hdr(u8 *header, const struct firmware *fw)
 {
-	__u8 *buffer;
+	u8 *buffer;
 	int buffer_size;
 	int i;
-	__u8 cs = 0;
+	u8 cs = 0;
 	struct ti_i2c_desc *i2c_header;
 	struct ti_i2c_image_header *img_header;
 	struct ti_i2c_firmware_rec *firmware_rec;
@@ -840,7 +840,7 @@ static int build_i2c_fw_hdr(u8 *header, const struct firmware *fw)
 		le16_to_cpu(img_header->Length));
 
 	for (i=0; i < buffer_size; i++) {
-		cs = (__u8)(cs + buffer[i]);
+		cs = (u8)(cs + buffer[i]);
 	}
 
 	kfree(buffer);
@@ -916,7 +916,7 @@ static int bulk_xfer(struct usb_serial *serial, void *buffer,
 }
 
 /* Download given firmware image to the device (IN BOOT MODE) */
-static int download_code(struct edgeport_serial *serial, __u8 *image,
+static int download_code(struct edgeport_serial *serial, u8 *image,
 							int image_length)
 {
 	int status = 0;
@@ -1090,7 +1090,7 @@ static int do_download_mode(struct edgeport_serial *serial,
 	if (!ti_manuf_desc)
 		return -ENOMEM;
 
-	status = get_manuf_info(serial, (__u8 *)ti_manuf_desc);
+	status = get_manuf_info(serial, (u8 *)ti_manuf_desc);
 	if (status) {
 		kfree(ti_manuf_desc);
 		return status;
@@ -1135,7 +1135,7 @@ static int do_download_mode(struct edgeport_serial *serial,
 		status = read_rom(serial, start_address +
 				sizeof(struct ti_i2c_desc),
 				sizeof(struct ti_i2c_firmware_rec),
-				(__u8 *)firmware_version);
+				(u8 *)firmware_version);
 		if (status) {
 			kfree(firmware_version);
 			kfree(rom_desc);
@@ -1261,8 +1261,8 @@ static int do_download_mode(struct edgeport_serial *serial,
 		if (start_address != 0) {
 #define HEADER_SIZE	(sizeof(struct ti_i2c_desc) + \
 				sizeof(struct ti_i2c_firmware_rec))
-			__u8 *header;
-			__u8 *vheader;
+			u8 *header;
+			u8 *vheader;
 
 			header = kmalloc(HEADER_SIZE, GFP_KERNEL);
 			if (!header) {
@@ -1408,8 +1408,8 @@ static int do_boot_mode(struct edgeport_serial *serial,
 	if (!check_i2c_image(serial)) {
 		struct ti_i2c_image_header *header;
 		int i;
-		__u8 cs = 0;
-		__u8 *buffer;
+		u8 cs = 0;
+		u8 *buffer;
 		int buffer_size;
 
 		/*
@@ -1420,7 +1420,7 @@ static int do_boot_mode(struct edgeport_serial *serial,
 		if (!ti_manuf_desc)
 			return -ENOMEM;
 
-		status = get_manuf_info(serial, (__u8 *)ti_manuf_desc);
+		status = get_manuf_info(serial, (u8 *)ti_manuf_desc);
 		if (status) {
 			kfree(ti_manuf_desc);
 			goto stayinbootmode;
@@ -1463,13 +1463,13 @@ static int do_boot_mode(struct edgeport_serial *serial,
 
 		for (i = sizeof(struct ti_i2c_image_header);
 				i < buffer_size; i++) {
-			cs = (__u8)(cs + buffer[i]);
+			cs = (u8)(cs + buffer[i]);
 		}
 
 		header = (struct ti_i2c_image_header *)buffer;
 
 		/* update length and checksum after padding */
-		header->Length 	 = cpu_to_le16((__u16)(buffer_size -
+		header->Length = cpu_to_le16((u16)(buffer_size -
 					sizeof(struct ti_i2c_image_header)));
 		header->CheckSum = cs;
 
@@ -1509,7 +1509,7 @@ static int ti_do_config(struct edgeport_port *port, int feature, int on)
 	return send_port_cmd(port->port, feature, on, NULL, 0);
 }
 
-static int restore_mcr(struct edgeport_port *port, __u8 mcr)
+static int restore_mcr(struct edgeport_port *port, u8 mcr)
 {
 	int status = 0;
 
@@ -1525,9 +1525,9 @@ static int restore_mcr(struct edgeport_port *port, __u8 mcr)
 }
 
 /* Convert TI LSR to standard UART flags */
-static __u8 map_line_status(__u8 ti_lsr)
+static u8 map_line_status(u8 ti_lsr)
 {
-	__u8 lsr = 0;
+	u8 lsr = 0;
 
 #define MAP_FLAG(flagUmp, flagUart)    \
 	if (ti_lsr & flagUmp) \
@@ -1545,7 +1545,7 @@ static __u8 map_line_status(__u8 ti_lsr)
 	return lsr;
 }
 
-static void handle_new_msr(struct edgeport_port *edge_port, __u8 msr)
+static void handle_new_msr(struct edgeport_port *edge_port, u8 msr)
 {
 	struct async_icount *icount;
 	struct tty_struct *tty;
@@ -1581,10 +1581,10 @@ static void handle_new_msr(struct edgeport_port *edge_port, __u8 msr)
 }
 
 static void handle_new_lsr(struct edgeport_port *edge_port, int lsr_data,
-							__u8 lsr, __u8 data)
+							u8 lsr, u8 data)
 {
 	struct async_icount *icount;
-	__u8 new_lsr = (__u8)(lsr & (__u8)(LSR_OVER_ERR | LSR_PAR_ERR |
+	u8 new_lsr = (u8)(lsr & (u8)(LSR_OVER_ERR | LSR_PAR_ERR |
 						LSR_FRM_ERR | LSR_BREAK));
 
 	dev_dbg(&edge_port->port->dev, "%s - %02x\n", __func__, new_lsr);
@@ -1596,7 +1596,7 @@ static void handle_new_lsr(struct edgeport_port *edge_port, int lsr_data,
 		 * Parity and Framing errors only count if they
 		 * occur exclusive of a break being received.
 		 */
-		new_lsr &= (__u8)(LSR_OVER_ERR | LSR_BREAK);
+		new_lsr &= (u8)(LSR_OVER_ERR | LSR_BREAK);
 
 	/* Place LSR data byte into Rx buffer */
 	if (lsr_data)
@@ -1625,8 +1625,8 @@ static void edge_interrupt_callback(struct urb *urb)
 	int port_number;
 	int function;
 	int retval;
-	__u8 lsr;
-	__u8 msr;
+	u8 lsr;
+	u8 msr;
 	int status = urb->status;
 
 	switch (status) {
@@ -2229,7 +2229,7 @@ static void change_port_settings(struct tty_struct *tty,
 	/* These flags must be set */
 	config->wFlags |= UMP_MASK_UART_FLAGS_RECEIVE_MS_INT;
 	config->wFlags |= UMP_MASK_UART_FLAGS_AUTO_START_ON_ERR;
-	config->bUartMode = (__u8)(edge_port->bUartMode);
+	config->bUartMode = (u8)(edge_port->bUartMode);
 
 	switch (cflag & CSIZE) {
 	case CS5:
@@ -2321,7 +2321,7 @@ static void change_port_settings(struct tty_struct *tty,
 	}
 
 	edge_port->baud_rate = baud;
-	config->wBaudRate = (__u16)((461550L + baud/2) / baud);
+	config->wBaudRate = (u16)((461550L + baud/2) / baud);
 
 	/* FIXME: Recompute actual baud from divisor here */
 
diff --git a/drivers/usb/serial/io_ti.h b/drivers/usb/serial/io_ti.h
index 50b899d55ed0..e31406c252dd 100644
--- a/drivers/usb/serial/io_ti.h
+++ b/drivers/usb/serial/io_ti.h
@@ -133,14 +133,14 @@
 #define UMPD_OEDB2_ADDRESS		0xFF10
 
 struct out_endpoint_desc_block {
-	__u8 Configuration;
-	__u8 XBufAddr;
-	__u8 XByteCount;
-	__u8 Unused1;
-	__u8 Unused2;
-	__u8 YBufAddr;
-	__u8 YByteCount;
-	__u8 BufferSize;
+	u8 Configuration;
+	u8 XBufAddr;
+	u8 XByteCount;
+	u8 Unused1;
+	u8 Unused2;
+	u8 YBufAddr;
+	u8 YByteCount;
+	u8 BufferSize;
 } __attribute__((packed));
 
 
@@ -150,14 +150,14 @@ struct out_endpoint_desc_block {
  */
 /* UART settings */
 struct ump_uart_config {
-	__u16 wBaudRate;	/* Baud rate                        */
-	__u16 wFlags;		/* Bitmap mask of flags             */
-	__u8 bDataBits;		/* 5..8 - data bits per character   */
-	__u8 bParity;		/* Parity settings                  */
-	__u8 bStopBits;		/* Stop bits settings               */
+	u16 wBaudRate;		/* Baud rate                        */
+	u16 wFlags;		/* Bitmap mask of flags             */
+	u8 bDataBits;		/* 5..8 - data bits per character   */
+	u8 bParity;		/* Parity settings                  */
+	u8 bStopBits;		/* Stop bits settings               */
 	char cXon;		/* XON character                    */
 	char cXoff;		/* XOFF character                   */
-	__u8 bUartMode;		/* Will be updated when a user      */
+	u8 bUartMode;		/* Will be updated when a user      */
 				/* interface is defined             */
 } __attribute__((packed));
 
@@ -168,8 +168,8 @@ struct ump_uart_config {
  */
 /* Interrupt packet structure */
 struct ump_interrupt {
-	__u8 bICode;			/* Interrupt code (interrupt num)   */
-	__u8 bIInfo;			/* Interrupt information            */
+	u8 bICode;			/* Interrupt code (interrupt num)   */
+	u8 bIInfo;			/* Interrupt information            */
 }  __attribute__((packed));
 
 
-- 
2.26.3

