Return-Path: <linux-usb+bounces-37028-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGgyI39p+2miawMAu9opvQ
	(envelope-from <linux-usb+bounces-37028-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 06 May 2026 18:17:03 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D770B4DDF65
	for <lists+linux-usb@lfdr.de>; Wed, 06 May 2026 18:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0ECFA3035D61
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2026 16:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BBEF3ED138;
	Wed,  6 May 2026 16:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmyAyj7w"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF43328255;
	Wed,  6 May 2026 16:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778084063; cv=none; b=fDQlry3EQgz9NbOiSAFwzyK3irkG1sodKmk1Nug4U9857DjpXEZCxiGBR0FxUqIucLb/hCwClMvI3XmLyDdowlyGgwOclw/mH1A6/1jTZIQzcVuxrYZ+WjAgtbYTdRa9WVKgrUedqekuw3HWXfqsPsz5fElLBe0TlQFhRVm+Xi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778084063; c=relaxed/simple;
	bh=e+WSP7c39oxyJZdpGOfpS4OXre0WZCPjfn+LDOw4WO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avkJoOocn6Pp7KhmxITQFh1UkkQ8dVPbNnBNjpTPm6U9zUwTIP4VldMnuBkS19rmgN39JMISXLRqav0V4gyJRIplJe3F/XXsJRDEs+MWzOW7o2maodjefDZTfWNLHLq/Th5muhvQyVL5lxfFrrNXc/954pLQH3fImdiSzAgjnYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EmyAyj7w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCEF6C2BCB0;
	Wed,  6 May 2026 16:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778084062;
	bh=e+WSP7c39oxyJZdpGOfpS4OXre0WZCPjfn+LDOw4WO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EmyAyj7wqsQb6VuMUAzxd2INWpfS9uX1ST17w5YNhQXNGQKxB6SKHrHXE91DKoAEK
	 CzF203D8FqLuuztkia1UyybAQikI6XrxW9ySLQAuLoyACiXW9vPh9V/q2U7exHi46q
	 DiMmOXQZq01fHASswS/9C1ZewGrMwiYGA5eGdjM/eRNDOJAfvv8ZJhe+7XFsc3xpEV
	 FhAuAnunAIpWNYsjcNUXSD2fXyIEUpOPlH/yT97iCfMCMInBcRNs6PRpmDmf/jSBNz
	 oxhfijYo5iHPda3WVMsNe8lVWHRqccJT9WCBDC/G48F2wNwUOwaI4fZ0s6NtjYjETQ
	 cDJAUA1MxUtgA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wKet9-00000000q86-2rx9;
	Wed, 06 May 2026 18:14:19 +0200
Date: Wed, 6 May 2026 18:14:19 +0200
From: Johan Hovold <johan@kernel.org>
To: hsyemail2@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Sheng-Yuan Huang <syhuang3@nuvoton.com>
Subject: Re: [PATCH v6] USB: serial: nct_usb_serial: add support for Nuvoton
 USB adapter
Message-ID: <afto223bDW2MV3bj@hovoldconsulting.com>
References: <cb5abe7e-8795-46d0-b5cd-66e1bf34fd49@suse.com>
 <20260317061446.9528-1-syhuang3@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317061446.9528-1-syhuang3@nuvoton.com>
X-Rspamd-Queue-Id: D770B4DDF65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37028-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hovoldconsulting.com:mid,nuvoton.com:email]

On Tue, Mar 17, 2026 at 02:14:46PM +0800, hsyemail2@gmail.com wrote:
> From: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> 
> Add support for the Nuvoton USB-to-serial adapter, which provides
> multiple serial ports over a single USB interface.
> 
> The device exposes one control endpoint, one bulk-in endpoint, and
> one bulk-out endpoint for data transfer. Port status is reported via
> an interrupt-in or bulk-in endpoint, depending on device configuration.
> 
> This driver implements basic TTY operations.
> 
> Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> ---
> 
> v6:
> - Address review comments from Oliver Neukum
> - Thanks to Oliver Neukum and Johan Hovold for their review
> - Narrow the protected scope in nct_tiocmset_helper(): port_lock now
>   protects only cached HCR updates, while command transmission is
>   serialized separately.
> - Serialize the open transaction to prevent concurrent open calls
>   from returning success before startup completes or before the open
>   command is sent.
> - Serialize the close transaction to avoid resource races.

Please include the changelog for all revisions here when resending.

>  drivers/usb/serial/Kconfig          |   10 +
>  drivers/usb/serial/Makefile         |    1 +
>  drivers/usb/serial/nct_usb_serial.c | 1455 +++++++++++++++++++++++++++
>  3 files changed, 1466 insertions(+)
>  create mode 100644 drivers/usb/serial/nct_usb_serial.c
> 
> diff --git a/drivers/usb/serial/Kconfig b/drivers/usb/serial/Kconfig
> index ef8d1c73c754..96a022bb9b21 100644
> --- a/drivers/usb/serial/Kconfig
> +++ b/drivers/usb/serial/Kconfig
> @@ -443,6 +443,16 @@ config USB_SERIAL_NAVMAN
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called navman.
>  
> +config USB_SERIAL_NUV_MULTI_UART
> +	tristate "USB Nuvoton Multi-Ports Serial Driver"
> +	depends on USB_SERIAL
> +	help
> +	Say Y here if you want to use a Nuvoton Multi-Ports USB to
> +	serial converter device
> +	
> +	To compile this driver as a module, choose M here: the
> +	module will be called nct_usb_serial.
> +
>  config USB_SERIAL_PL2303
>  	tristate "USB Prolific 2303 Single Port Serial Driver"
>  	help
> diff --git a/drivers/usb/serial/Makefile b/drivers/usb/serial/Makefile
> index c7bb1a88173e..c07919a52076 100644
> --- a/drivers/usb/serial/Makefile
> +++ b/drivers/usb/serial/Makefile
> @@ -41,6 +41,7 @@ obj-$(CONFIG_USB_SERIAL_MOS7720)		+= mos7720.o
>  obj-$(CONFIG_USB_SERIAL_MOS7840)		+= mos7840.o
>  obj-$(CONFIG_USB_SERIAL_MXUPORT)		+= mxuport.o
>  obj-$(CONFIG_USB_SERIAL_NAVMAN)			+= navman.o
> +obj-$(CONFIG_USB_SERIAL_NUV_MULTI_UART)		+= nct_usb_serial.o
>  obj-$(CONFIG_USB_SERIAL_OMNINET)		+= omninet.o
>  obj-$(CONFIG_USB_SERIAL_OPTICON)		+= opticon.o
>  obj-$(CONFIG_USB_SERIAL_OPTION)			+= option.o
> diff --git a/drivers/usb/serial/nct_usb_serial.c b/drivers/usb/serial/nct_usb_serial.c
> new file mode 100644
> index 000000000000..89dbfdc92136
> --- /dev/null
> +++ b/drivers/usb/serial/nct_usb_serial.c
> @@ -0,0 +1,1455 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024-2025 Nuvoton Corp
> + * Copyright (C) 2024-2025 Sheng-Yuan Huang <syhuang3@nuvoton.com>
> + *
> + * Nuvoton USB to serial adapter driver
> + *
> + * This device interface consists of one control endpoint for configuration,
> + * one bulk-out endpoint used for transmitting data for all serial ports,
> + * and one bulk-in endpoint for receiving data from all serial ports.
> + * The status of the ports may be reported via either an interrupt endpoint
> + * or the bulk-in endpoint, depending on the device configuration.
> + *
> + * The number of serial ports is configurable in firmware and reported to
> + * the driver via a vendor command at probe time.
> + *
> + * Host-device handshake sequence:
> + *   1. Host sends SET_INIT to initialize the device.
> + *   2. Host sends GET_PORTS_SUPPORT to query enabled ports (bitmask).
> + *   3. For each port open: Host sends SET_OPEN_PORT.
> + *   4. Host sends SET_CONFIG/SET_BAUD to configure UART parameters.
> + *   5. For each port close: Host sends SET_CLOSE_PORT.
> + */
> +
> +#include <linux/bitops.h>

I don't think this one is used. 

> +#include <linux/errno.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>

> +#include <linux/moduleparam.h>

Nor this one.

> +#include <linux/serial.h>

Nor this one?

> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/tty.h>

> +#include <linux/tty_driver.h>
> +#include <linux/tty_port.h>

These two are typically included via tty.h (and you don't need the first
one either way).

> +#include <linux/tty_flip.h>

> +#include <linux/uaccess.h>

Same here.

> +#include <linux/usb.h>
> +#include <linux/usb/serial.h>
> +#include <linux/kfifo.h>
> +#include <linux/mutex.h>
> +
> +#define NCT_WRITE_FIFO_SIZE 1024
> +
> +#define NCT_VENDOR_ID			0x0416
> +#define NCT_PRODUCT_ID			0x200b
> +#define NCT_USB_CLASS			0xff
> +#define NCT_USB_SUBCLASS		0x0
> +#define NCT_USB_PROTOCOL		0x1
> +
> +#define NCT_MAX_VENDOR_READ_SIZE	8
> +
> +static const struct usb_device_id id_table[] = {
> +	{USB_DEVICE_AND_INTERFACE_INFO(NCT_VENDOR_ID, NCT_PRODUCT_ID,
> +				       NCT_USB_CLASS, NCT_USB_SUBCLASS,
> +				       NCT_USB_PROTOCOL)},

I already asked you why you match on the interface class and protocol
here. Does the device have more than one interface?

Please post the corresponding output of usb-devices.

> +	{} /* Terminating entry */
> +};
> +
> +MODULE_DEVICE_TABLE(usb, id_table);
> +
> +#define NCT_MAX_SEND_BULK_SIZE 128

This one is unused. What does it represent and should it be used instead
of removed?

I also asked you about the meaning of the following defines in v4, but
you never replied:

	> +#define NCT_MAX_PACKAGE_SIZE		4096 /* The max size of one
	> writing package */
	> +#define NCT_MAX_BULK_IN_SIZE		512
	> +#define NCT_MAX_BULK_OUT_SIZE	512
	
	The last three are not used either. Might they become useful? Can you
	expand on their meaning?

> +/* The port does not exist in FW (for device status). */
> +#define NCT_EMPTY_PORT	0xff
> +
> +/* Hardware configuration */
> +#define NCT_MAX_NUM_COM_DEVICES		8
> +
> +#define NCT_DEFAULT_BAUD		14 /* 115200 */
> +static const unsigned int NCT_BAUD_SUP[] = {
> +	/* It should be the same as FW's baud-rate table. */
> +	B0,	B50,	B75,	B150,	B300,	B600,	B1200,
> +	B1800,	B2400,	B4800,	B9600,	B19200,	B38400,	B57600,
> +	B115200, B230400, B460800, B921600, B1500000
> +};
> +
> +/* USB request */
> +#define NCT_VENDOR_COM_READ_REQUEST_TYPE	0xc0
> +#define NCT_VENDOR_COM_WRITE_REQUEST_TYPE	0x40
> +#define NCT_VENDOR_COM_READ_REQUEST		0x01
> +#define NCT_VENDOR_COM_WRITE_REQUEST		0x01
> +/* Index definition */
> +#define NCT_VCOM_INDEX_GLOBAL	0x0f
> +
> +/* Command */
> +#define NCT_VCOM_GET_NUM_PORTS		0
> +#define NCT_VCOM_GET_PORTS_SUPPORT	1
> +#define NCT_VCOM_GET_BAUD		2
> +#define NCT_VCOM_SET_INIT		3
> +#define NCT_VCOM_SET_CONFIG		4
> +#define NCT_VCOM_SET_BAUD		5
> +#define NCT_VCOM_SET_HCR		6
> +#define NCT_VCOM_SET_OPEN_PORT		7
> +#define NCT_VCOM_SET_CLOSE_PORT		8
> +#define NCT_VCOM_SILENT			9
> +/* Use bulk-in status instead of interrupt-in status */
> +#define NCT_VCON_SET_BULK_IN_STATUS	10
> +
> +struct nct_vendor_cmd {
> +	/* bits[3:0]: index, bits[11:4]: cmd, bits[15:12]: reserved */
> +	__le16 val;
> +};

Why you need nct_ctrl_msg at all? It looks like you just keep converting
back forth between host and le16 for no good reason.

Can't you just use host order

	u16 cmd

throughout and pass that to usb_control_msg_recv() in
nct_vendor_read/write() (and drop conversions in nct_build_cmd(),
nct_build_ctrl_msg() and nct_vendor_read/write())?

> +
> +#define NCT_CMD_INDEX_MASK	0x000f
> +#define NCT_CMD_CMD_MASK	0x0ff0
> +#define NCT_CMD_CMD_SHIFT	4
> +
> +static inline __le16 nct_build_cmd(u8 cmd_code, u8 index)
> +{
> +	return cpu_to_le16(((u16)cmd_code << NCT_CMD_CMD_SHIFT) |
> +			   (index & NCT_CMD_INDEX_MASK));
> +}
> +
> +static inline u8 nct_get_cmd_index(__le16 val)
> +{
> +	return le16_to_cpu(val) & NCT_CMD_INDEX_MASK;
> +}

This one is not used and can be dropped.

> +static inline u8 nct_get_cmd_cmd(__le16 val)
> +{
> +	return (le16_to_cpu(val) & NCT_CMD_CMD_MASK) >> NCT_CMD_CMD_SHIFT;
> +}
> +
> +#define NCT_HDR_MAGIC		0xa5
> +#define NCT_HDR_MAGIC2		0x5a
> +#define NCT_HDR_MAGIC_STATUS	0x5b
> +
> +struct nct_packet_header {
> +	u8 magic;
> +	u8 magic2;
> +	__le16 len_and_idx;  /* bits[3:0]: idx, bits[15:4]: len */
> +} __packed;
> +
> +#define NCT_HDR_IDX_MASK	0x000f
> +#define NCT_HDR_LEN_MASK	0xfff0
> +#define NCT_HDR_LEN_SHIFT	4
> +
> +static inline void nct_set_hdr_idx_len(struct nct_packet_header *hdr,
> +				       u8 idx, u16 len)
> +{
> +	hdr->len_and_idx = cpu_to_le16((len << NCT_HDR_LEN_SHIFT) |
> +				       (idx & NCT_HDR_IDX_MASK));
> +}
> +
> +static inline u8 nct_get_hdr_idx(const struct nct_packet_header *hdr)
> +{
> +	return le16_to_cpu(hdr->len_and_idx) & NCT_HDR_IDX_MASK;
> +}
> +
> +static inline u16 nct_get_hdr_len(const struct nct_packet_header *hdr)
> +{
> +	return (le16_to_cpu(hdr->len_and_idx) & NCT_HDR_LEN_MASK) >>
> +		NCT_HDR_LEN_SHIFT;
> +}
> +
> +/* The definitions are for the fields of nct_ctrl_msg. */
> +#define NCT_VCOM_1_STOP_BIT		0
> +#define NCT_VCOM_2_STOP_BITS		1
> +#define NCT_VCOM_PARITY_NONE		0
> +#define NCT_VCOM_PARITY_ODD		1
> +#define NCT_VCOM_PARITY_EVEN		2
> +#define NCT_VCOM_DL5			0
> +#define NCT_VCOM_DL6			1
> +#define NCT_VCOM_DL7			2
> +#define NCT_VCOM_DL8			3
> +#define NCT_VCOM_DISABLE_FLOW_CTRL	0
> +#define NCT_VCOM_XOFF			1
> +#define NCT_VCOM_RTS_CTS		2
> +
> +struct nct_ctrl_msg {
> +	__le16 val;
> +};

And similar for nct_ctrl_msg. Why not used host order (u16 msg)
throughout and only keep the final conversion to LE in
nct_vendor_write()?

> +#define NCT_CTRL_STOP_BIT_MASK		0x0001
> +#define NCT_CTRL_PARITY_MASK		0x0006
> +#define NCT_CTRL_PARITY_SHIFT		1
> +#define NCT_CTRL_DATA_LEN_MASK		0x0018
> +#define NCT_CTRL_DATA_LEN_SHIFT		3
> +#define NCT_CTRL_FLOW_MASK		0x0060
> +#define NCT_CTRL_FLOW_SHIFT		5
> +#define NCT_CTRL_SPD_MASK		0x0f80
> +#define NCT_CTRL_SPD_SHIFT		7
> +#define NCT_CTRL_RESERVED_MASK		0xf000
> +#define NCT_CTRL_RESERVED_SHIFT		12
> +
> +static inline __le16 nct_build_ctrl_msg(u8 stop_bit, u8 parity, u8 data_len,
> +					u8 flow, u8 spd)
> +{
> +	u16 val = 0;
> +
> +	val |= (stop_bit & NCT_CTRL_STOP_BIT_MASK);
> +	val |= ((parity & (NCT_CTRL_PARITY_MASK >> NCT_CTRL_PARITY_SHIFT)) <<
> +		NCT_CTRL_PARITY_SHIFT);
> +	val |= ((data_len &
> +		 (NCT_CTRL_DATA_LEN_MASK >> NCT_CTRL_DATA_LEN_SHIFT)) <<
> +		NCT_CTRL_DATA_LEN_SHIFT);
> +	val |= ((flow & (NCT_CTRL_FLOW_MASK >> NCT_CTRL_FLOW_SHIFT)) <<
> +		NCT_CTRL_FLOW_SHIFT);
> +	val |= ((spd & (NCT_CTRL_SPD_MASK >> NCT_CTRL_SPD_SHIFT)) <<
> +		NCT_CTRL_SPD_SHIFT);

If you shift the argument before you mask above you can drop the mask
shift.

> +
> +	return cpu_to_le16(val);
> +}
> +
> +#define NCT_USR_RDR	0x01
> +#define NCT_USR_ORR	0x02
> +#define NCT_USR_PBER	0x04
> +#define NCT_USR_NSER	0x08
> +#define NCT_USR_SBD	0x10
> +#define NCT_USR_TBRE	0x20
> +#define NCT_USR_TSRE	0x40
> +#define NCT_USR_RFEI	0x80
> +#define NCT_HSR_TCTS	0x01
> +#define NCT_HSR_TDSR	0x02
> +#define NCT_HSR_FERI	0x04
> +#define NCT_HSR_TDCD	0x08
> +#define NCT_HSR_CTS	0x10
> +#define NCT_HSR_DSR	0x20
> +#define NCT_HSR_RI	0x40
> +#define NCT_HSR_DCD	0x80
> +#define NCT_HCR_DTR	0x01
> +#define NCT_HCR_RTS	0x02
> +
> +#define NCT_UART_STATE_MSR_MASK (NCT_HSR_TCTS | NCT_HSR_TDSR | \
> +				 NCT_HSR_TDCD | NCT_HSR_DCD)
> +
> +struct nct_port_status {
> +	u8 index;
> +	u8 usr;
> +	u8 hsr;
> +	u8 hcr;
> +};
> +
> +struct nct_serial {
> +	/* Protects the private data in structure 'nct_serial'. */

As I mentioned before, such comments doesn't really add any value so you
can drop it.

> +	spinlock_t serial_lock;
> +	/* Serializes open/close startup-shutdown transactions. */
> +	struct mutex open_close_mutex;

Just call it 'mutex'. You only have one. Or at least shorten it to
'open_mutex'.

> +	unsigned int open_count;
> +
> +	/* Reading data information */
> +	struct nct_tty_port *cur_port;
> +	int cur_len;
> +
> +	bool use_bulk_status;
> +	u8 en_device_mask;
> +	u8 last_assigned_hw_idx;
> +	struct usb_endpoint_descriptor *bulk_out_ep;
> +	struct usb_serial_port *port_by_hw_idx[NCT_MAX_NUM_COM_DEVICES];
> +};
> +
> +struct nct_tty_port {
> +	u8 hw_idx;
> +	u8 usr;
> +	u8 hsr;
> +	u8 hcr;
> +	/*
> +	 * Flow control - stop writing data to device.
> +	 * 0: Write enable, 1: Stop writing
> +	 */
> +	bool flow_stop_wrt;
> +
> +	/* Serializes modem-control transactions sent to the device. */
> +	struct mutex mctrl_mutex;
> +	spinlock_t port_lock; /* Protects the port data. */

Please drop the comment, it adds no values.

> +	bool write_urb_in_use;
> +};
> +
> +/* Functions */
> +
> +/* Read from USB control pipe */
> +static int nct_vendor_read(struct usb_interface *intf,
> +			   struct nct_vendor_cmd cmd, void *buf,
> +			   int size)
> +{
> +	struct usb_device *udev = interface_to_usbdev(intf);
> +	int ret;
> +
> +	if (size > NCT_MAX_VENDOR_READ_SIZE)
> +		return -EINVAL;
> +
> +	ret = usb_control_msg_recv(udev, 0,
> +				   NCT_VENDOR_COM_READ_REQUEST,
> +				   NCT_VENDOR_COM_READ_REQUEST_TYPE,
> +				   le16_to_cpu(cmd.val),
> +				   intf->cur_altsetting->desc.bInterfaceNumber,
> +				   buf, size, 100, GFP_KERNEL);
> +
> +	return ret;
> +}
> +
> +static int nct_vendor_write(struct usb_interface *intf,
> +			    struct nct_vendor_cmd cmd, u16 val)
> +{
> +	struct device *dev = &intf->dev;
> +	struct usb_device *udev = interface_to_usbdev(intf);
> +	__le16 le_val = cpu_to_le16(val);
> +	int ret;
> +
> +	ret = usb_control_msg_send(udev, 0,
> +				   NCT_VENDOR_COM_WRITE_REQUEST,
> +				   NCT_VENDOR_COM_WRITE_REQUEST_TYPE,
> +				   le16_to_cpu(cmd.val),
> +				   intf->cur_altsetting->desc.bInterfaceNumber,
> +				   &le_val, sizeof(le_val), 100, GFP_KERNEL);
> +	if (ret)
> +		dev_err(dev, "failed to write [%04x]: %d\n",
> +			nct_get_cmd_cmd(cmd.val), ret);
> +
> +	return ret;
> +}
> +
> +/*
> + * Prepare write buffer by extracting data from core write FIFO and
> + * adding header
> + */
> +static int nct_prepare_write_buffer(struct usb_serial_port *port,
> +				    void *dest, size_t size)
> +{
> +	unsigned int count;
> +	struct nct_packet_header hdr;
> +	struct nct_tty_port *tport = usb_get_serial_port_data(port);

Nit: Please consider reording these reverse christmas tree style, which
tends to be easier to read (i.e. put the longest lines first).

> +
> +	if (size <= sizeof(hdr))
> +		return 0;

The buffer will at least be as large as the endpoint max packet size so
this is not needed unless something is really broken.

You can specify explicit buffer sizes in the driver structure to avoid
this check:

	.bulk_in_size
	.bulk_out_size

and the buffer can be larger than the endpoint (if the device can handle
it).

If that's not enough, you can add sanity checks to probe.

> +
> +	/* Leave room for header */
> +	count = kfifo_out_locked(&port->write_fifo, dest + sizeof(hdr),
> +				 size - sizeof(hdr), &port->lock);
> +
> +	if (!count)
> +		return 0;

Core has already made sure there is data in the fifo.

> +
> +	hdr.magic = NCT_HDR_MAGIC;
> +	hdr.magic2 = NCT_HDR_MAGIC2;
> +	nct_set_hdr_idx_len(&hdr, tport->hw_idx, count);
> +
> +	/*
> +	 * Copy header into buffer (use memcpy to avoid aliasing/unaligned
> +	 * access).
> +	 */
> +	memcpy(dest, &hdr, sizeof(hdr));

And the buffer alignment is at least 8-byte aligned
(ARCH_KMALLOC_MINALIGN) so this is not needed either.

> +
> +	return count + sizeof(hdr);
> +}
> +
> +static u16 nct_set_baud(struct usb_interface *intf, u16 index,
> +			unsigned int cflag, bool *found)
> +{
> +	struct nct_vendor_cmd cmd;
> +	struct nct_ctrl_msg msg;
> +	u16 i;
> +	u8 spd = NCT_DEFAULT_BAUD;
> +
> +	*found = false;
> +	cmd.val = nct_build_cmd(NCT_VCOM_SET_BAUD, index);
> +	for (i = 0; i < ARRAY_SIZE(NCT_BAUD_SUP); i++) {
> +		if ((cflag & CBAUD) != NCT_BAUD_SUP[i])
> +			continue;
> +
> +		spd = i;
> +		/*
> +		 * Create control message
> +		 * Note: The NCT_VCOM_SET_BAUD only set the baud rate
> +		 */
> +		msg.val = nct_build_ctrl_msg(0, 0, 0, 0, spd);
> +		if (nct_vendor_write(intf, cmd, le16_to_cpu(msg.val)))
> +			dev_err(&intf->dev, "set index %d speed error\n",
> +				index);

Please add brackets for readability wherever you have multi-line
statements (as I mentioned before).

In this case you could also just drop the line break as the resulting
line is short enough.

> +		else
> +			*found = true;
> +
> +		break;
> +	}
> +
> +	return spd;
> +}
> +
> +static void nct_set_termios(struct tty_struct *tty,
> +			    struct usb_serial_port *port,
> +			    const struct ktermios *old)
> +{
> +	struct nct_tty_port *tport = usb_get_serial_port_data(port);
> +	struct usb_serial *serial = port->serial;
> +	struct usb_interface *intf = serial->interface;
> +	struct ktermios *termios = &tty->termios;
> +	struct nct_ctrl_msg msg;
> +	struct nct_vendor_cmd cmd;
> +	u8 stop_bit;
> +	u8 parity;
> +	u8 data_len;
> +	u8 flow;
> +	bool baud_found = false;
> +	speed_t old_baud;
> +
> +	/* Device does not support CMSPAR. */
> +	termios->c_cflag &= ~CMSPAR;
> +
> +	cmd.val = nct_build_cmd(NCT_VCOM_SET_CONFIG, tport->hw_idx);
> +
> +	/* Set stop bit */
> +	if (C_CSTOPB(tty))
> +		stop_bit = NCT_VCOM_2_STOP_BITS;
> +	else
> +		stop_bit = NCT_VCOM_1_STOP_BIT;
> +
> +	/* Set parity */
> +	if (C_PARENB(tty)) {
> +		if (C_PARODD(tty))
> +			parity = NCT_VCOM_PARITY_ODD;
> +		else
> +			parity = NCT_VCOM_PARITY_EVEN;
> +	} else {
> +		parity = NCT_VCOM_PARITY_NONE;
> +	}

As I mentioned before you need to clear CMSPAR in the termios if you
don't support sticky parity.

> +
> +	/* Set data bit length */
> +	switch (C_CSIZE(tty)) {
> +	case CS5:
> +		data_len = NCT_VCOM_DL5;
> +		break;
> +	case CS6:
> +		data_len = NCT_VCOM_DL6;
> +		break;
> +	case CS7:
> +		data_len = NCT_VCOM_DL7;
> +		break;
> +	case CS8:
> +	default:
> +		data_len = NCT_VCOM_DL8;
> +		break;
> +	}
> +
> +	/* Set flow control */
> +	if (C_CRTSCTS(tty))
> +		flow = NCT_VCOM_RTS_CTS;
> +	else if (I_IXON(tty))
> +		flow = NCT_VCOM_XOFF;
> +	else
> +		flow = NCT_VCOM_DISABLE_FLOW_CTRL;
> +
> +	tty_port_set_cts_flow(tty->port, C_CRTSCTS(tty));

I don't think you need to set this flag as the device appears to support
automatic hardware flow control (NCT_VCOM_RTS_CTS). More below.

> +	/* Create control message (spd=0: speed set separately via SET_BAUD) */
> +	msg.val = nct_build_ctrl_msg(stop_bit, parity, data_len, flow, 0);
> +	nct_vendor_write(intf, cmd, le16_to_cpu(msg.val));
> +
> +	/*
> +	 * Set baud rate if speed changed.
> +	 * Always call tty_encode_baud_rate() to keep kernel's baud rate
> +	 * synchronized with the device, especially during initial open
> +	 * when the device uses its default baud rate.
> +	 */
> +	if (!old || old->c_ospeed != termios->c_ospeed)
> +		nct_set_baud(intf, tport->hw_idx, termios->c_cflag, &baud_found);
> +
> +	if (baud_found) {
> +		tty_encode_baud_rate(tty, tty_get_baud_rate(tty),
> +				     tty_get_baud_rate(tty));
> +	} else {
> +		if (old && tty_termios_baud_rate(old))
> +			old_baud = tty_termios_baud_rate(old);
> +		else
> +			old_baud = 115200; /* Sync with device default */
> +
> +		tty_encode_baud_rate(tty, old_baud, old_baud);
> +	}
> +}
> +
> +static int nct_break(struct tty_struct *tty, int break_state)
> +{
> +	struct usb_serial_port *port = tty->driver_data;
> +	struct nct_tty_port *tport = usb_get_serial_port_data(port);
> +	struct usb_serial *serial = port->serial;
> +	struct usb_interface *intf = serial->interface;
> +	struct nct_vendor_cmd cmd;
> +
> +	cmd.val = nct_build_cmd(NCT_VCOM_SILENT, tport->hw_idx);
> +
> +	return nct_vendor_write(intf, cmd, 0);
> +}
> +
> +static int nct_tiocmset_helper(struct tty_struct *tty, unsigned int set,
> +			       unsigned int clear)

Drop the "_helper" suffix.

> +{
> +	struct usb_serial_port *port = tty->driver_data;
> +	struct nct_tty_port *tport = usb_get_serial_port_data(port);
> +	struct usb_serial *serial = port->serial;
> +	struct usb_interface *intf = serial->interface;
> +	struct nct_ctrl_msg msg;
> +	struct nct_vendor_cmd cmd;
> +	u8 hcr;
> +	int ret;
> +
> +	mutex_lock(&tport->mctrl_mutex);
> +
> +	/*
> +	 * port_lock serializes updates of the cached modem-control bits (hcr).
> +	 * The control transfer may sleep, so only the hcr read-modify-write is
> +	 * done under the spinlock.
> +	 */
> +	spin_lock_irq(&tport->port_lock);
> +	hcr = tport->hcr;
> +
> +	if (set & TIOCM_RTS)
> +		hcr |= NCT_HCR_RTS;
> +	if (set & TIOCM_DTR)
> +		hcr |= NCT_HCR_DTR;
> +	if (clear & TIOCM_RTS)
> +		hcr &= ~NCT_HCR_RTS;
> +	if (clear & TIOCM_DTR)
> +		hcr &= ~NCT_HCR_DTR;
> +
> +	tport->hcr = hcr;
> +	spin_unlock_irq(&tport->port_lock);
> +
> +	cmd.val = nct_build_cmd(NCT_VCOM_SET_HCR, tport->hw_idx);
> +	msg.val = cpu_to_le16(hcr);
> +	ret = nct_vendor_write(intf, cmd, le16_to_cpu(msg.val));
> +	mutex_unlock(&tport->mctrl_mutex);
> +
> +	return ret;
> +}
> +
> +static int nct_tiocmget(struct tty_struct *tty)
> +{
> +	struct usb_serial_port *port = tty->driver_data;
> +	struct nct_tty_port *tport = usb_get_serial_port_data(port);
> +	unsigned int res;
> +	u8 hcr, hsr;
> +
> +	spin_lock_irq(&tport->port_lock);
> +	hcr = tport->hcr;
> +	hsr = tport->hsr;
> +	spin_unlock_irq(&tport->port_lock);
> +	res = ((hcr & NCT_HCR_DTR) ? TIOCM_DTR : 0) |
> +	      ((hcr & NCT_HCR_RTS) ? TIOCM_RTS : 0) |
> +	      ((hsr & NCT_HSR_CTS) ? TIOCM_CTS : 0) |
> +	      ((hsr & NCT_HSR_DSR) ? TIOCM_DSR : 0) |
> +	      ((hsr & NCT_HSR_RI) ? TIOCM_RI : 0) |
> +	      ((hsr & NCT_HSR_DCD) ? TIOCM_CD : 0);
> +
> +	return res;
> +}
> +
> +static void nct_rx_throttle(struct tty_struct *tty)
> +{
> +	/* Handle RTS line for RTS/CTS flow control */
> +	if (C_CRTSCTS(tty))
> +		nct_tiocmset_helper(tty, 0, TIOCM_RTS);
> +}

You never replied to my previous comments here:

	First, can you even control RTS when the device is in hardware
	flow control mode?

	Second, I think you're supposed to just stop reading from the
	device here to exert back pressure so that it in turn deasserts
	RTS.

But perhaps the latter does not work here as the bulk-in endpoint is
shared.

> +static void nct_rx_unthrottle(struct tty_struct *tty)
> +{
> +	/* Handle RTS line for RTS/CTS flow control */
> +	if (C_CRTSCTS(tty))
> +		nct_tiocmset_helper(tty, TIOCM_RTS, 0);
> +}
> +
> +static int nct_serial_write(struct tty_struct *tty,
> +			    struct usb_serial_port *port,
> +			    const unsigned char *buf,
> +			    int count)
> +{
> +	struct nct_tty_port *tport = usb_get_serial_port_data(port);
> +	unsigned int written;
> +	int ret;
> +
> +	/* Flow control */
> +	if (tty_port_cts_enabled(tty->port))
> +		if (tport->flow_stop_wrt)
> +			return 0;

Similarly here, you should be able to rely on the device to deassert RTS
when its buffers fill up, right?

I apparently already asked you this in a comment to v4.

Please make sure to address and/or respond to all comments before
sending another version.

> +
> +	if (!port)
> +		return -ENXIO;

How could port be NULL here?

> +
> +	/* Copy into core write FIFO */
> +	written = kfifo_in_locked(&port->write_fifo, buf, count, &port->lock);
> +

Nit: drop the newline

> +	if (written) {
> +		ret = usb_serial_generic_write_start(port, GFP_ATOMIC);
> +		if (ret && ret != -EBUSY)
> +			dev_err(&port->dev,
> +				"usb_serial_generic_write_start failed: %d\n",
> +				ret);
> +	}
> +
> +	return written;
> +}

Without the flow control bits you should be able to use the generic
write implementation directly here (or possibly call it after checking).

> +
> +static unsigned int nct_write_room(struct tty_struct *tty)
> +{
> +	struct usb_serial_port *port = tty->driver_data;
> +	struct nct_tty_port *tport = usb_get_serial_port_data(port);
> +	unsigned long flags;
> +	unsigned int room;
> +
> +	spin_lock_irqsave(&tport->port_lock, flags);
> +	room = kfifo_avail(&port->write_fifo);
> +	spin_unlock_irqrestore(&tport->port_lock, flags);
> +	return room;
> +}

Just use the generic implementation.

> +static unsigned int nct_chars_in_buffer(struct tty_struct *tty)
> +{
> +	struct usb_serial_port *port = tty->driver_data;
> +	unsigned int qlen;
> +
> +	/* Get queued bytes in core write FIFO */
> +	qlen = kfifo_len(&port->write_fifo);
> +	return qlen;
> +}

Here too.

> +/*
> + *  Starts reads urb on all ports. It is to avoid potential issues caused by
> + *  multiple ports being opened almost simultaneously.
> + *  It must be called AFTER startup, with urbs initialized.
> + *  Returns 0 if successful, non-zero error otherwise.
> + */
> +static int nct_startup_device(struct usb_serial *serial)
> +{
> +	int ret = 0;
> +	struct nct_serial *serial_priv = usb_get_serial_data(serial);
> +	struct usb_serial_port *port;
> +	unsigned long flags;
> +	bool first_open = false;
> +
> +	/* Caller must hold serial_priv->open_close_mutex. */

You can use lockdep_assert_held() to document this.

> +
> +	/* Start URBs on first open */
> +	spin_lock_irqsave(&serial_priv->serial_lock, flags);
> +	if (serial_priv->open_count++ == 0)
> +		first_open = true;
> +	spin_unlock_irqrestore(&serial_priv->serial_lock, flags);

Why do you take the serial_lock spinlock for this when you already hold
the open mutex?

> +	/* Only the first open submits read_urb and, if needed, interrupt_in_urb. */
> +	if (!first_open)
> +		goto out_return;

Just return directly (and skip ret initialisation above).

> +
> +	/* Start reading from bulk in endpoint */
> +	port = serial->port[0];
> +	ret = usb_submit_urb(port->read_urb, GFP_KERNEL);
> +	if (ret) {
> +		dev_err(&port->dev, "failed to submit read urb: %d\n", ret);
> +		goto err_rollback;
> +	}

Why not use both URBs which is more efficient (i.e.
usb_serial_generic_submit_read_urbs())?

> +
> +	/* For getting status from interrupt-in */
> +	if (!serial_priv->use_bulk_status) {
> +		/* Start reading from interrupt pipe */
> +		port = serial->port[0];
> +		ret = usb_submit_urb(port->interrupt_in_urb, GFP_KERNEL);
> +		if (ret) {
> +			dev_err(&port->dev,
> +				"failed to submit interrupt urb: %d\n",
> +				ret);
> +			goto err_kill_read;
> +		}
> +	}
> +
> +	ret = 0;
> +	goto out_return;

Just return explicit zero here.

> +
> +err_kill_read:
> +	usb_kill_urb(serial->port[0]->read_urb);
> +err_rollback:
> +	spin_lock_irqsave(&serial_priv->serial_lock, flags);
> +	if (serial_priv->open_count)
> +		serial_priv->open_count--;
> +	if (!serial_priv->open_count) {
> +		serial_priv->cur_port = NULL;
> +		serial_priv->cur_len = 0;
> +	}
> +	spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
> +
> +out_return:
> +	return ret;
> +}
> +
> +static void nct_shutdown_device(struct usb_serial *serial)
> +{
> +	struct nct_serial *serial_priv = usb_get_serial_data(serial);
> +	unsigned long flags;
> +	bool last_close = false;
> +
> +	/* Caller must hold serial_priv->open_close_mutex. */
> +
> +	spin_lock_irqsave(&serial_priv->serial_lock, flags);
> +	if (serial_priv->open_count) {
> +		serial_priv->open_count--;
> +		if (!serial_priv->open_count) {
> +			last_close = true;
> +			serial_priv->cur_port = NULL;
> +			serial_priv->cur_len = 0;
> +		}
> +	}
> +	spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
> +
> +	if (!last_close)
> +		return;
> +
> +	usb_kill_urb(serial->port[0]->read_urb);
> +	if (!serial_priv->use_bulk_status)
> +		usb_kill_urb(serial->port[0]->interrupt_in_urb);
> +}
> +
> +static int nct_open(struct tty_struct *tty, struct usb_serial_port *port)
> +{
> +	struct nct_vendor_cmd cmd;
> +	struct nct_ctrl_msg msg;
> +	struct nct_tty_port *tport = usb_get_serial_port_data(port);
> +	struct usb_serial *serial = port->serial;
> +	struct nct_serial *serial_priv = usb_get_serial_data(serial);
> +	struct usb_interface *intf = serial->interface;
> +	int ret;
> +
> +	if (!port->serial)
> +		return -ENXIO;

How could this happen?

> +	mutex_lock(&serial_priv->open_close_mutex);
> +
> +	/* Be sure the device is started up */
> +	ret = nct_startup_device(port->serial);
> +	if (ret)
> +		goto out_unlock;
> +
> +	cmd.val = nct_build_cmd(NCT_VCOM_SET_OPEN_PORT, tport->hw_idx);
> +	msg.val = cpu_to_le16(0);
> +	ret = nct_vendor_write(intf, cmd, le16_to_cpu(msg.val));
> +	if (ret) {
> +		dev_err(&port->dev, "Failed to open port: %d\n", ret);
> +		nct_shutdown_device(serial);
> +		goto out_unlock;

Nit: I prefer "err_unlock" to make it clear that this path is only used
on errors.

> +	}
> +
> +	mutex_unlock(&serial_priv->open_close_mutex);
> +
> +	wake_up_interruptible(&port->port.open_wait);

This one should only be called on carrier detect changes.

> +
> +	/*
> +	 * Delay 1ms for firmware to configure hardware after opening the port.
> +	 * (Especially at high speed)
> +	 */
> +	usleep_range(1000, 2000);

Nit: add a newline here.

> +	return 0;
> +
> +out_unlock:
> +	mutex_unlock(&serial_priv->open_close_mutex);

Nit: and here.

> +	return ret;
> +}
> +
> +static void nct_close(struct usb_serial_port *port)
> +{
> +	struct nct_tty_port *tport = usb_get_serial_port_data(port);
> +	struct usb_serial *serial = port->serial;
> +	struct nct_serial *serial_priv = usb_get_serial_data(serial);
> +	struct usb_interface *intf = serial->interface;
> +	struct nct_ctrl_msg msg;
> +	struct nct_vendor_cmd cmd;
> +
> +	mutex_lock(&port->serial->disc_mutex);
> +	mutex_lock(&serial_priv->open_close_mutex);
> +	/* If disconnected, don't send the close-command to the firmware */
> +	if (port->serial->disconnected)
> +		goto exit;

Nit: "out_unlock" is more descriptive.

> +
> +	/* Send 'Close Port' to the device */
> +	cmd.val = nct_build_cmd(NCT_VCOM_SET_CLOSE_PORT, tport->hw_idx);
> +	msg.val = cpu_to_le16(0);
> +	nct_vendor_write(intf, cmd, le16_to_cpu(msg.val));
> +
> +exit:
> +	nct_shutdown_device(port->serial);
> +	mutex_unlock(&serial_priv->open_close_mutex);
> +	mutex_unlock(&port->serial->disc_mutex);
> +}
> +
> +static void nct_update_status(struct usb_serial *serial, unsigned char *data)
> +{
> +	struct nct_port_status *nps = (struct nct_port_status *)data;
> +	struct usb_interface *intf = serial->interface;
> +	struct nct_serial *serial_priv = usb_get_serial_data(serial);
> +	struct nct_tty_port *tport;
> +	struct tty_struct *tty;
> +	struct usb_serial_port *port;
> +	unsigned long flags;
> +
> +	if (nps->index >= NCT_MAX_NUM_COM_DEVICES) {
> +		if (nps->index != NCT_EMPTY_PORT) /* Un-used port */
> +			dev_warn(&intf->dev, "receive wrong H/W index\n");
> +		return;
> +	}
> +	if (!(nps->hsr & (NCT_UART_STATE_MSR_MASK | NCT_HSR_CTS)))
> +		return; /* No state changes */
> +
> +	port = serial_priv->port_by_hw_idx[nps->index];
> +	if (!port)
> +		return;
> +
> +	tport = usb_get_serial_port_data(port);
> +	if (!tport)
> +		return;
> +
> +	spin_lock_irqsave(&tport->port_lock, flags);
> +	tport->usr = nps->usr;
> +	tport->hsr = nps->hsr;
> +	tport->hcr = nps->hcr;
> +	spin_unlock_irqrestore(&tport->port_lock, flags);
> +
> +	if (serial->disconnected) {
> +		dev_err(&intf->dev,
> +			"device disconnected, skip status update\n");
> +		return;
> +	}
> +
> +	tty = tty_port_tty_get(&port->port);
> +	if (!tty)
> +		return; /* The port has been closed. */
> +
> +	if (nps->hsr & NCT_UART_STATE_MSR_MASK) {
> +		if (nps->hsr & NCT_HSR_DCD) {
> +			struct tty_ldisc *ld = tty_ldisc_ref(tty);
> +
> +			if (ld) {
> +				if (ld->ops->dcd_change)
> +					ld->ops->dcd_change(tty, 0x01);
> +				tty_ldisc_deref(ld);
> +			}
> +			wake_up_interruptible(&tty->port->open_wait);
> +		}

Can't you use usb_serial_handle_dcd_change() here?

> +	}
> +
> +	/* Flow control */
> +	if (tty_port_cts_enabled(&port->port)) {
> +		if ((nps->hsr & NCT_HSR_CTS)) {
> +			if (tport->flow_stop_wrt)
> +				tport->flow_stop_wrt = false;
> +		} else {
> +			tport->flow_stop_wrt = true;
> +		}
> +	}

So this may be needed either if the device stops transmitting when CTS
is deasserted.

> +
> +	tty_kref_put(tty);
> +}
> +
> +/*
> + * nct_usb_serial_read - process incoming bulk-in data.
> + *
> + * The device multiplexes all UART ports over a single bulk-in endpoint.
> + * Each data segment is prefixed with a 4-byte header:
> + *
> + *   byte 0: magic (0xa5)
> + *   byte 1: magic2
> + *           0x5a = data packet
> + *           0x5b = status packet
> + *   bytes 2-3: length and index (little-endian 16-bit)
> + *           bits [3:0]  = port index (1-based, valid range 1-7; 0 is reserved)
> + *           bits [15:4] = payload length in bytes
> + *
> + * Multiple packets for different ports may be concatenated within a
> + * single URB. The driver allows a packet's payload to span across URB
> + * boundaries. In that case, the driver records the remaining length (cur_len)
> + * and target port (cur_port) to reassemble the data on subsequent URBs.
> + *
> + * Status packets (magic2 = 0x5b) carry an array of 4-byte per-port
> + * status structures instead of UART data:
> + *
> + *   byte 0: port index (1-based; 0 = reserved, 0xff = unused entry)
> + *   byte 1: UART status (USR)
> + *           bit0: RX data ready
> + *           bit1: overrun error
> + *           bit2: parity error
> + *           bit3: framing error
> + *           bit4: break detected
> + *           bit5: TX buffer empty
> + *           bit6: TX shift register empty
> + *           bit7: RX FIFO error
> + *   byte 2: modem status (MSR)
> + *           bit0: CTS change
> + *           bit1: DSR change
> + *           bit2: RI change
> + *           bit3: DCD change
> + *           bit4: CTS level
> + *           bit5: DSR level
> + *           bit6: RI level
> + *           bit7: DCD level
> + *   byte 3: modem control (MCR)
> + *           bit0: DTR level
> + *           bit1: RTS level
> + */

Thanks for adding this.

> +static void nct_usb_serial_read(struct urb *urb)
> +{
> +	struct usb_serial_port *port = urb->context;
> +	struct usb_serial *serial = port->serial;
> +	struct usb_interface *intf = serial->interface;
> +	struct nct_serial *serial_priv = usb_get_serial_data(serial);
> +	struct nct_tty_port *tport;
> +	struct nct_packet_header *hdr = NULL;
> +	unsigned char *data = urb->transfer_buffer;
> +	int i, j;
> +	int actual_len = urb->actual_length;
> +	int len = 0;
> +	u8 hdr_idx;
> +	struct nct_port_status *nps;
> +	unsigned long flags;
> +
> +	if (!urb->actual_length)
> +		return;
> +
> +again:
> +	spin_lock_irqsave(&serial_priv->serial_lock, flags);
> +	tport = serial_priv->cur_port;
> +	if (!tport) {
> +		/*
> +		 * Handle a new data packet (i.e., it is not
> +		 * the remaining data without a header).
> +		 * The packet does not need reassembly at this point.
> +		 */
> +		for (i = 0; i < urb->actual_length; i++) {
> +			if (i + sizeof(struct nct_packet_header) >
> +			    urb->actual_length) {
> +				/* Not enough data for a header */
> +				spin_unlock_irqrestore(&serial_priv->serial_lock,
> +						       flags);
> +				return;
> +			}
> +
> +			hdr = (struct nct_packet_header *)data;
> +			/* Decode the header */
> +
> +			/*
> +			 * Status data is also transmitted via bulk-in
> +			 * pipe.
> +			 * Current FW reports a fixed 24-byte status payload.
> +			 */
> +			if (serial_priv->use_bulk_status &&
> +			    hdr->magic == NCT_HDR_MAGIC &&
> +			    hdr->magic2 == NCT_HDR_MAGIC_STATUS &&
> +			    nct_get_hdr_len(hdr) == 24 &&
> +			    actual_len >= 28) {
> +				/*
> +				 * Notice: actual_len will be decreased,
> +				 * it is equal to urb->actual_length
> +				 * only at the beginning.
> +				 */
> +
> +				/*
> +				 * Status report.
> +				 * It should be a standalone package in
> +				 * one URB.
> +				 */
> +				data += sizeof(struct nct_packet_header);
> +				actual_len -= sizeof(struct nct_packet_header);
> +
> +				nps = (struct nct_port_status *)data;
> +				if ((actual_len % sizeof(*nps)) != 0) {
> +					dev_err(&intf->dev,
> +						"bad status len: %d\n",
> +						actual_len);
> +					spin_unlock_irqrestore(
> +						&serial_priv->serial_lock,
> +						flags);
> +					return;
> +				}
> +
> +				for (j = 0; j < (actual_len / sizeof(*nps));
> +				     j++) {
> +					nct_update_status(serial,
> +							  (unsigned char *)nps);

Why do you cast to unsigned char * only to cast back in
nct_update_status() again?

> +					nps++;
> +				}

Looks like you fixed the bug I pointed out here (but it's not mentioned
in the change log) and tried to limit the line lengths by adding line
breaks (which doesn't necessarily improve readability), but the
indentation is still six levels.

Did you try to look into adding helper functions to break the parsing up
and make it more readable?

> +
> +				spin_unlock_irqrestore(&serial_priv->serial_lock,
> +						       flags);
> +				return;
> +			}
> +
> +			hdr_idx = nct_get_hdr_idx(hdr);
> +			if (hdr->magic == NCT_HDR_MAGIC &&
> +			    hdr->magic2 == NCT_HDR_MAGIC2 &&
> +			    hdr_idx > 0 &&
> +			    hdr_idx < NCT_MAX_NUM_COM_DEVICES &&
> +			    nct_get_hdr_len(hdr) <= 512)
> +				break;
> +
> +			data++;
> +			actual_len--;
> +			if (!actual_len) {
> +				dev_err(&intf->dev,
> +					"decode serial packet size failed\n");
> +				spin_unlock_irqrestore(&serial_priv->serial_lock,
> +						       flags);
> +				return;
> +			}
> +		}
> +		/*
> +		 * Resolve TTY port by the idx in header and ensure it is valid.
> +		 * Record it for two purposes:
> +		 *   (1) If the current packet payload is incomplete, the next URB
> +		 *       continues payload bytes without a new header.
> +		 *   (2) Route received bytes to the correct TTY port.
> +		 */
> +		port = serial_priv->port_by_hw_idx[nct_get_hdr_idx(hdr)];
> +		if (!port) {
> +			dev_err(&intf->dev,
> +				"decode serial packet index failed\n");
> +			spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
> +			return;
> +		}
> +
> +		tport = usb_get_serial_port_data(port);
> +		if (!tport) {
> +			spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
> +			return;
> +		}
> +		/*
> +		 * Calculate the data length.
> +		 * Then, check if the length specified in the header matches
> +		 * the data length. If not, it indicates that the data we
> +		 * received spans across two (or more) packets.
> +		 */
> +		actual_len -= sizeof(struct nct_packet_header);
> +		data += sizeof(struct nct_packet_header);
> +		/* actual_len: the data length of the data we got this time */
> +		if (nct_get_hdr_len(hdr) > actual_len) {
> +			/*
> +			 * It means the length specified in the header (the
> +			 * custom header) is greater than the length of the
> +			 * data we received.
> +			 * Therefore, the data received this time belongs to a
> +			 * single packet payload segment (i.e. no next header in this URB).
> +			 */
> +			len = actual_len;
> +			/*
> +			 * cur_len: Record how many data does not handle yet
> +			 */
> +			serial_priv->cur_len = nct_get_hdr_len(hdr) - len;
> +			/*
> +			 * Record the current port. When we receive the
> +			 * remaining data for this packet next time
> +			 */
> +			serial_priv->cur_port = tport;
> +		} else {
> +			/*
> +			 * The received data crosses packet boundaries (does not belong
> +			 * to the same header). We only handle data by
> +			 * the length in header. And we will handle
> +			 * another packet when 'goto "again" '.
> +			 */
> +			len = nct_get_hdr_len(hdr);
> +		}
> +	} else { /* Handling remaining data that crosses packet boundaries */
> +		if (serial_priv->cur_len > actual_len) {
> +			/*
> +			 * The unhandled part of the data exceeds the data we
> +			 * received this time. We only handle the data we
> +			 * have, expecting more data to be received later.
> +			 */
> +			len = actual_len;
> +		} else {
> +			/*
> +			 * This means the packet has been fully handled.
> +			 * Clear 'cur_port' as no additional data needs to be
> +			 * attached to the current packet.
> +			 */
> +			len = serial_priv->cur_len;
> +			serial_priv->cur_port = NULL;
> +		}
> +		serial_priv->cur_len -= len;
> +	}
> +	spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
> +	tty_insert_flip_string(&port->port, data, len);
> +	data += len;
> +	/*
> +	 * Send data to the tty device (according to the port identified above).
> +	 */
> +	tty_flip_buffer_push(&port->port);
> +	actual_len -= len;
> +
> +	/*
> +	 * It means that the data we received this time contains two or
> +	 * more data packets, so it needs to continue processing the next
> +	 * data packets.
> +	 */
> +	if (actual_len > 0)
> +		goto again;
> +}
> +
> +static void nct_process_read_bulk(struct urb *urb)
> +{
> +	struct usb_serial_port *port =  urb->context;

nit:                                   ^ double space

> +	struct nct_serial *serial_priv = usb_get_serial_data(port->serial);
> +	bool stopped = false;
> +	int status = urb->status;
> +	int ret;
> +
> +	switch (status) {
> +	case 0:
> +		nct_usb_serial_read(urb);
> +		break;
> +	case -ENOENT:
> +	case -ECONNRESET:
> +	case -ESHUTDOWN:
> +		if (!(status == -ENOENT
> +		      && serial_priv

serial_priv is not NULL here

> +		      && serial_priv->open_count
> +		      && !port->serial->disconnected)) {
> +			dev_dbg(&port->dev, "urb halted, status=%d\n", status);
> +			stopped = true;

Why did you add this? It should not be needed.

> +		}
> +		break;
> +	case -EPIPE:
> +		dev_err(&port->dev, "urb stalled (EPIPE)\n");
> +		stopped = true;
> +		break;
> +	default:
> +		dev_dbg(&port->dev, "nonzero urb status: %d\n", status);
> +		break;
> +	}
> +
> +	if (stopped)
> +		return;
> +
> +	ret = usb_submit_urb(urb, GFP_ATOMIC);
> +	if (ret != 0 && ret != -EPERM)
> +		dev_err(&port->dev,
> +			"failed resubmitting urb, ret=%d\n",
> +			ret);

Again, please use bracket around all blocks with multi-line statements
(throughout).

And please use the following format consistently for errors

	"failed to ...: %d\n", ret

(i.e. ": " instead of ", ret=").

> +}
> +
> +static void nct_read_bulk_callback(struct urb *urb)
> +{
> +	struct usb_serial_port *port = urb->context;
> +
> +	/* Do not resubmit if the urb is being killed */
> +	if (urb->status == -ESHUTDOWN)
> +		return;

Why check -ESHUTDOWN twice?

I apparently already pointed this out.

> +
> +	if (!port || !port->serial)
> +		return;

Neither will be NULL.

I already said this.

Please don't ignore feedback, no one likes repeating themselves (and
especially not kernel maintainers).

> +
> +	if (port->serial->disconnected)
> +		return;

This should not be needed either.

> +
> +	/* Processing data */
> +	nct_process_read_bulk(urb);
> +}
> +
> +static int nct_calc_num_ports(struct usb_serial *serial,
> +			      struct usb_serial_endpoints *epds)
> +{
> +	struct nct_vendor_cmd cmd;
> +	u8 buf[8];

Move these after the following struct declarations.

> +	struct nct_serial *serial_priv = usb_get_serial_data(serial);
> +	struct usb_interface *intf = serial->interface;
> +	struct usb_host_interface *iface_desc = intf->cur_altsetting;
> +	struct usb_endpoint_descriptor *bulk_in = NULL;
> +	struct usb_endpoint_descriptor *bulk_out = NULL;
> +	struct usb_endpoint_descriptor *int_in = NULL;
> +	int ret;
> +	int i;
> +	int num_ports;
> +
> +	/* Send init command */
> +	cmd.val = nct_build_cmd(NCT_VCOM_SET_INIT, NCT_VCOM_INDEX_GLOBAL);
> +	ret = nct_vendor_write(intf, cmd, 0);
> +	if (ret) {
> +		dev_err(&intf->dev, "set COM init error\n");
> +		return ret;
> +	}
> +
> +	/* Get ports' index supported by the device(/FW) */
> +	cmd.val = nct_build_cmd(NCT_VCOM_GET_PORTS_SUPPORT, NCT_VCOM_INDEX_GLOBAL);
> +	ret = nct_vendor_read(intf, cmd, buf, 1);
> +	if (ret) {
> +		dev_err(&intf->dev,

Line break not needed.

> +			"get COM port index error\n");
> +		return ret;
> +	}
> +
> +	if (!serial_priv) {
> +		serial_priv = kzalloc_obj(*serial_priv, GFP_KERNEL);
> +		if (!serial_priv)
> +			return -ENOMEM;
> +		spin_lock_init(&serial_priv->serial_lock);
> +		mutex_init(&serial_priv->open_close_mutex);
> +		usb_set_serial_data(serial, serial_priv);
> +	}

This does not belong here in calc_num_ports(), but if you really must
allocate memory you currently need to use devm_kzalloc() as otherwise it
may not be freed in all error paths.

But its better to avoid that and defer allocation to attach() if
you can.

> +	serial_priv->en_device_mask = buf[0];

Can't you just store the mask in the serial port driver data
temporarily, and retrieve it in attach when you setup the driver data
(or just query the device again)?

> +	serial_priv->last_assigned_hw_idx = 0; /* Note: hw_idx is based on 1 */
> +
> +	for (i = 0, num_ports = 0; i < NCT_MAX_NUM_COM_DEVICES; i++) {
> +		if (!(buf[0] & BIT(i)))
> +			continue;	/* The port is disabled */
> +
> +		num_ports++;
> +	}
> +
> +	for (i = 0; i < iface_desc->desc.bNumEndpoints; i++) {
> +		struct usb_endpoint_descriptor *endpoint =
> +			&iface_desc->endpoint[i].desc;
> +
> +		if (!bulk_in && usb_endpoint_is_bulk_in(endpoint))
> +			bulk_in = endpoint;
> +		if (!bulk_out && usb_endpoint_is_bulk_out(endpoint))
> +			bulk_out = endpoint;
> +		if (!int_in && usb_endpoint_is_int_in(endpoint))
> +			int_in = endpoint;
> +	}

Use may be able to use usb_find_common_endpoints() here, but I don't
think you need it either since core will already have stored them in
epds->bulk_in[0], etc.

> +
> +	if (!bulk_in || !bulk_out)
> +		return -ENODEV;

You already set the driver num_bulk_out and num_bulk_in fields so core
would already have rejected any device which doesn't have at least that
many endpoints.

> +
> +	for (i = 0; i < num_ports; i++) {
> +		epds->bulk_in[i] = bulk_in;

The in endpoints do not need to be set for each port, just the bulk_out
one so that the write urbs are allocated.

> +		epds->bulk_out[i] = bulk_out;

> +		if (int_in && i == 0)
> +			epds->interrupt_in[i] = int_in;

No need for this either.

> +	}
> +	epds->num_bulk_out = num_ports;
> +
> +	return num_ports;
> +}
> +
> +static int nct_attach(struct usb_serial *serial)
> +{
> +	struct nct_serial *serial_priv = usb_get_serial_data(serial);
> +
> +	if (!serial_priv)
> +		return -ENODEV;
> +
> +	serial_priv->use_bulk_status = true;
> +	if (serial->port[0] && serial->port[0]->interrupt_in_urb)

No need to check that port[0] exists (e.g. since you require at least
one endpoint).

> +		serial_priv->use_bulk_status = false;
> +
> +	return 0;
> +}
> +
> +static int nct_port_probe(struct usb_serial_port *port)
> +{
> +	struct nct_tty_port *tport;
> +	struct usb_serial *serial = port->serial;
> +	struct nct_serial *serial_priv = usb_get_serial_data(serial);
> +	unsigned long flags;
> +	int i, ret;
> +	unsigned int fifo_state;
> +
> +	tport = kzalloc_obj(*tport, GFP_KERNEL);
> +	if (!tport)
> +		return -ENOMEM;
> +
> +	/* Assign hw_idx */
> +	mutex_init(&tport->mctrl_mutex);
> +	spin_lock_init(&tport->port_lock);
> +
> +	spin_lock_irqsave(&serial_priv->serial_lock, flags);
> +	for (i = serial_priv->last_assigned_hw_idx + 1;
> +	     i < NCT_MAX_NUM_COM_DEVICES; i++) {
> +		if ((serial_priv->en_device_mask & (1 << i)) == 0)
> +			continue; /* The port is disabled */
> +
> +		tport->hw_idx = i;
> +		serial_priv->last_assigned_hw_idx = i;
> +		break;
> +	}
> +	spin_unlock_irqrestore(&serial_priv->serial_lock, flags);

It seems better to set up the port mapping for all ports once at
attach().

> +
> +	usb_set_serial_port_data(port, tport);
> +
> +	spin_lock_irqsave(&serial_priv->serial_lock, flags);
> +	serial_priv->port_by_hw_idx[tport->hw_idx] = port;
> +	spin_unlock_irqrestore(&serial_priv->serial_lock, flags);

> +	fifo_state = kfifo_initialized(&port->write_fifo);
> +
> +	/*
> +	 * Keep the FIFO if it is already initialized.
> +	 */
> +	if (fifo_state)
> +		return 0;
> +	ret = kfifo_alloc(&port->write_fifo, NCT_WRITE_FIFO_SIZE, GFP_KERNEL);
> +	if (ret) {
> +		kfree(tport);
> +		return ret;
> +	}

This should not be needed either as core allocates the write_fifo for
all ports with a bulk_out endpoint (which you just set up in
calc_num_ports()).

> +
> +	return 0;
> +}
> +
> +static void nct_interrupt_in_callback(struct urb *urb)
> +{
> +	struct usb_serial_port *port = urb->context;
> +	int status = urb->status;
> +	struct usb_serial *serial = port->serial;
> +	unsigned char *data = urb->transfer_buffer;
> +	int retval;
> +	int i;
> +	int actual_len = urb->actual_length;
> +	struct nct_port_status *nps;

Again, please try to approximate reverse xmas style declarations.

> +
> +	switch (status) {
> +	case 0:
> +		/* Success */
> +		if ((actual_len % sizeof(*nps)) != 0)
> +			return;
> +
> +		nps = (struct nct_port_status *)data;
> +		for (i = 0; i < (actual_len / sizeof(*nps)); i++) {
> +			nct_update_status(serial, (unsigned char *)nps);
> +			nps++;
> +		}

Looks like this could share a helper function with the bulk_status
parsing?

> +		break;
> +
> +	case -ECONNRESET:
> +	case -ENOENT:
> +	case -ESHUTDOWN:
> +		/* This urb is terminated, clean up */
> +		return;
> +	default:
> +		break;
> +	}

Nit: add a newline

> +	retval = usb_submit_urb(urb, GFP_ATOMIC);
> +	if (retval)
> +		dev_err(&port->dev, "submit intr URB failed, ret=%d\n",
> +			retval);
> +}
> +
> +static void nct_disconnect(struct usb_serial *serial)
> +{
> +	struct nct_serial *serial_priv = usb_get_serial_data(serial);
> +	unsigned long flags;
> +
> +	/* Reset status */
> +	spin_lock_irqsave(&serial_priv->serial_lock, flags);
> +	serial_priv->open_count = 0;
> +	serial_priv->cur_port = NULL;
> +	serial_priv->cur_len = 0;
> +	spin_unlock_irqrestore(&serial_priv->serial_lock, flags);

The device is going away so there's no need to reset any state (and all
ports would already have been closed).

> +
> +}
> +
> +static void nct_port_remove(struct usb_serial_port *port)
> +{
> +	struct nct_tty_port *priv = usb_get_serial_port_data(port);
> +	struct nct_serial *serial_priv = usb_get_serial_data(port->serial);
> +	unsigned long flags;
> +
> +	if (priv) {

priv is non-NULL here

> +		spin_lock_irqsave(&serial_priv->serial_lock, flags);
> +		if (priv->hw_idx < NCT_MAX_NUM_COM_DEVICES)

hw_idx should never be invalid here, right?

> +			serial_priv->port_by_hw_idx[priv->hw_idx] = NULL;
> +		spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
> +	}
> +	kfree(priv);
> +}
> +
> +static void nct_release(struct usb_serial *serial)
> +{
> +	struct nct_serial *serial_priv;
> +
> +	serial_priv = usb_get_serial_data(serial);
> +	kfree(serial_priv);
> +}
> +
> +static int nct_suspend(struct usb_serial *serial, pm_message_t message)
> +{
> +	struct nct_serial *serial_priv = usb_get_serial_data(serial);
> +	int i;
> +
> +	/* Stop all URBs */
> +	usb_kill_urb(serial->port[0]->read_urb);
> +	for (i = 0; i < serial->type->num_ports; i++)
> +		usb_kill_urb(serial->port[i]->write_urb);

The generic implementation uses both write urbs.

> +
> +	if (!serial_priv->use_bulk_status)
> +		usb_kill_urb(serial->port[0]->interrupt_in_urb);

But you strictly don't need to implement suspend as you only use URBs
allocated by core, which core will kill for you on suspend.

> +
> +	return 0;
> +}
> +
> +static int nct_resume(struct usb_serial *serial)
> +{
> +	struct nct_serial *serial_priv = usb_get_serial_data(serial);
> +	struct usb_interface *intf = serial->interface;
> +	unsigned long flags;
> +	int ret;
> +
> +	/* Reset driver internal state */
> +	spin_lock_irqsave(&serial_priv->serial_lock, flags);
> +	serial_priv->cur_port = NULL;
> +	serial_priv->cur_len = 0;
> +	spin_unlock_irqrestore(&serial_priv->serial_lock, flags);
> +
> +	/* Resubmit URBs */
> +	if (!serial_priv->open_count)
> +		return 0;
> +
> +	ret = usb_submit_urb(serial->port[0]->read_urb, GFP_KERNEL);
> +	if (ret)
> +		dev_err(&intf->dev, "submit read URB failed, ret=%d\n",
> +			ret);
> +
> +	if (!serial_priv->use_bulk_status) {
> +		ret = usb_submit_urb(serial->port[0]->interrupt_in_urb,
> +				     GFP_KERNEL);
> +		if (ret)
> +			dev_err(&intf->dev,
> +				"submit interrupt URB failed, ret=%d\n",
> +				ret);
> +	}

You may be able to use usb_serial_generic_resume() here instead of open
coding, which also takes care of restarting writes in case there is
still data in the fifos.

At least if you are going to use both read urbs back to back.

> +
> +	return 0;
> +}
> +
> +static struct usb_serial_driver nct_usb_serial_device = {
> +	.driver	= {
> +		.name =		"nct_mtuart",
> +	},
> +	.description =		"Nuvoton USB to serial adapter",
> +	.id_table =		id_table,
> +	.num_bulk_in =		1,
> +	.num_bulk_out =		1,
> +	.open =			nct_open,
> +	.close =		nct_close,
> +	.write =		nct_serial_write,
> +	.write_room =		nct_write_room,
> +	.write_bulk_callback =	usb_serial_generic_write_bulk_callback,
> +	.prepare_write_buffer =	nct_prepare_write_buffer,
> +	.read_bulk_callback =	nct_read_bulk_callback,
> +	.read_int_callback =	nct_interrupt_in_callback,
> +	.chars_in_buffer =	nct_chars_in_buffer,
> +	.throttle =		nct_rx_throttle,
> +	.unthrottle =		nct_rx_unthrottle,
> +	.attach =		nct_attach,
> +	.calc_num_ports =	nct_calc_num_ports,
> +	.set_termios =		nct_set_termios,
> +	.break_ctl =		nct_break,
> +	.tiocmget =		nct_tiocmget,
> +	.tiocmset =		nct_tiocmset_helper,
> +	.disconnect =		nct_disconnect,
> +	.release =		nct_release,
> +	.port_probe =		nct_port_probe,
> +	.port_remove =		nct_port_remove,
> +	.suspend =		nct_suspend,
> +	.resume =		nct_resume,
> +};
> +
> +static struct usb_serial_driver * const nct_serial_drivers[] = {
> +	&nct_usb_serial_device, NULL
> +};
> +
> +module_usb_serial_driver(nct_serial_drivers, id_table);
> +MODULE_DESCRIPTION("Nuvoton USB to serial adaptor driver");
> +MODULE_AUTHOR("Sheng-Yuan Huang <syhuang3@nuvoton.com>");
> +MODULE_LICENSE("GPL v2");

> +

Nit: stray newline

Again, I think this looks pretty good over all.

Johan

