Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC16521558C
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 12:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728892AbgGFKab (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 06:30:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:50808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727896AbgGFKab (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 Jul 2020 06:30:31 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9198120739;
        Mon,  6 Jul 2020 10:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594031429;
        bh=3VzGyE6D7NYg8y0xBRxSVGGhX0VzwdLoP405CEVCTiU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2buofFPDedX3GgOM1VV2Ozjdubj/KsthTNFCNusvzDKsNZPs9IDwd7BOWL1s8/BBi
         HMDMQ8MMr94HsKm3qubXNi1s3CLJSqdocNgEqXRsYwe+3rqUjjKluyXg6G3GzTFCDh
         N6BF6wA/8EbrK/xIjtDD7njgYZRR3rfLA2c0XlZs=
Date:   Mon, 6 Jul 2020 12:30:26 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Diego Elio =?iso-8859-1?Q?Petten=F2?= <flameeyes@flameeyes.com>
Cc:     linux-usb@vger.kernel.org, Pete Zaitcev <zaitcev@redhat.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Kris Katterjohn <katterjohn@gmail.com>
Subject: Re: [PATCH] usbmon: expose the usbmon structures and constants as an
 UAPI header.
Message-ID: <20200706103026.GA10624@kroah.com>
References: <20200705150225.21500-1-flameeyes@flameeyes.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200705150225.21500-1-flameeyes@flameeyes.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jul 05, 2020 at 04:02:25PM +0100, Diego Elio Pettenò wrote:
> Previously any application wanting to implement the usbmon binary
> interfaces needed to re-declare the structures and constants, leading to
> structure duplication and confusion over whether these structures fall into
> the system call exception or not.
> 
> Also update Paolo's address to match `net/core/dst_cache.c` as the previous
> one bounces.

When you say "also" that means it should be a separate patch.  Please do
that for this one.

> 
> Cc: linux-usb@vger.kernel.org
> Cc: Pete Zaitcev <zaitcev@redhat.com>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Kris Katterjohn <katterjohn@gmail.com>
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Signed-off-by: Diego Elio Pettenò <flameeyes@flameeyes.com>
> ---
>  Documentation/usb/usbmon.rst |  12 ++---
>  drivers/usb/mon/mon_bin.c    |  94 ++------------------------------
>  include/uapi/linux/usb/mon.h | 102 +++++++++++++++++++++++++++++++++++
>  3 files changed, 111 insertions(+), 97 deletions(-)
>  create mode 100644 include/uapi/linux/usb/mon.h
> 
> diff --git a/Documentation/usb/usbmon.rst b/Documentation/usb/usbmon.rst
> index b0bd51080799..cf98ea553ba1 100644
> --- a/Documentation/usb/usbmon.rst
> +++ b/Documentation/usb/usbmon.rst
> @@ -211,11 +211,13 @@ Bulk wrapper to a storage device at address 5::
>  Raw binary format and API
>  =========================
>  
> -The overall architecture of the API is about the same as the one above,
> -only the events are delivered in binary format. Each event is sent in
> -the following structure (its name is made up, so that we can refer to it)::
> +The overall architecture of the API is about the same as the one above, only the
> +events are delivered in binary format. The structures and constants are defined
> +in linux/usb/mon.h.
>  
> -  struct usbmon_packet {
> +Each event is sent in the following structure::
> +
> +  struct mon_bin_hdr {
>  	u64 id;			/*  0: URB ID - from submission to callback */
>  	unsigned char type;	/*  8: Same as text; extensible. */
>  	unsigned char xfer_type; /*    ISO (0), Intr, Control, Bulk (3) */
> @@ -346,8 +348,6 @@ be polled with select(2) and poll(2). But lseek(2) does not work.
>  
>  * Memory-mapped access of the kernel buffer for the binary API
>  
> -The basic idea is simple:
> -
>  To prepare, map the buffer by getting the current size, then using mmap(2).
>  Then, execute a loop similar to the one written in pseudo-code below::
>  
> diff --git a/drivers/usb/mon/mon_bin.c b/drivers/usb/mon/mon_bin.c
> index f48a23adbc35..e914fd8d039e 100644
> --- a/drivers/usb/mon/mon_bin.c
> +++ b/drivers/usb/mon/mon_bin.c
> @@ -4,8 +4,8 @@
>   *
>   * This is a binary format reader.
>   *
> - * Copyright (C) 2006 Paolo Abeni (paolo.abeni@email.it)
> - * Copyright (C) 2006,2007 Pete Zaitcev (zaitcev@redhat.com)
> + * Copyright (C) 2006 Paolo Abeni <pabeni@redhat.com>

You can't change someone's copyright lines, sorry.

> + * Copyright (C) 2006,2007 Pete Zaitcev <zaitcev@redhat.com>

Why this change?


>   */
>  
>  #include <linux/kernel.h>
> @@ -23,34 +23,10 @@
>  #include <linux/time64.h>
>  
>  #include <linux/uaccess.h>
> +#include <linux/usb/mon.h>
>  
>  #include "usb_mon.h"
>  
> -/*
> - * Defined by USB 2.0 clause 9.3, table 9.2.
> - */
> -#define SETUP_LEN  8
> -
> -/* ioctl macros */
> -#define MON_IOC_MAGIC 0x92
> -
> -#define MON_IOCQ_URB_LEN _IO(MON_IOC_MAGIC, 1)
> -/* #2 used to be MON_IOCX_URB, removed before it got into Linus tree */
> -#define MON_IOCG_STATS _IOR(MON_IOC_MAGIC, 3, struct mon_bin_stats)
> -#define MON_IOCT_RING_SIZE _IO(MON_IOC_MAGIC, 4)
> -#define MON_IOCQ_RING_SIZE _IO(MON_IOC_MAGIC, 5)
> -#define MON_IOCX_GET   _IOW(MON_IOC_MAGIC, 6, struct mon_bin_get)
> -#define MON_IOCX_MFETCH _IOWR(MON_IOC_MAGIC, 7, struct mon_bin_mfetch)
> -#define MON_IOCH_MFLUSH _IO(MON_IOC_MAGIC, 8)
> -/* #9 was MON_IOCT_SETAPI */
> -#define MON_IOCX_GETX   _IOW(MON_IOC_MAGIC, 10, struct mon_bin_get)
> -
> -#ifdef CONFIG_COMPAT
> -#define MON_IOCX_GET32 _IOW(MON_IOC_MAGIC, 6, struct mon_bin_get32)
> -#define MON_IOCX_MFETCH32 _IOWR(MON_IOC_MAGIC, 7, struct mon_bin_mfetch32)
> -#define MON_IOCX_GETX32   _IOW(MON_IOC_MAGIC, 10, struct mon_bin_get32)
> -#endif
> -
>  /*
>   * Some architectures have enormous basic pages (16KB for ia64, 64KB for ppc).
>   * But it's all right. Just use a simple way to make sure the chunk is never
> @@ -81,38 +57,6 @@
>  #define BUFF_DFL   CHUNK_ALIGN(300*1024)
>  #define BUFF_MIN     CHUNK_ALIGN(8*1024)
>  
> -/*
> - * The per-event API header (2 per URB).
> - *
> - * This structure is seen in userland as defined by the documentation.
> - */
> -struct mon_bin_hdr {
> -	u64 id;			/* URB ID - from submission to callback */
> -	unsigned char type;	/* Same as in text API; extensible. */
> -	unsigned char xfer_type;	/* ISO, Intr, Control, Bulk */
> -	unsigned char epnum;	/* Endpoint number and transfer direction */
> -	unsigned char devnum;	/* Device address */
> -	unsigned short busnum;	/* Bus number */
> -	char flag_setup;
> -	char flag_data;
> -	s64 ts_sec;		/* ktime_get_real_ts64 */
> -	s32 ts_usec;		/* ktime_get_real_ts64 */
> -	int status;
> -	unsigned int len_urb;	/* Length of data (submitted or actual) */
> -	unsigned int len_cap;	/* Delivered length */
> -	union {
> -		unsigned char setup[SETUP_LEN];	/* Only for Control S-type */
> -		struct iso_rec {
> -			int error_count;
> -			int numdesc;
> -		} iso;
> -	} s;
> -	int interval;
> -	int start_frame;
> -	unsigned int xfer_flags;
> -	unsigned int ndesc;	/* Actual number of ISO descriptors */
> -};
> -
>  /*
>   * ISO vector, packed into the head of data stream.
>   * This has to take 16 bytes to make sure that the end of buffer
> @@ -125,38 +69,6 @@ struct mon_bin_isodesc {
>  	u32 _pad;
>  };
>  
> -/* per file statistic */
> -struct mon_bin_stats {
> -	u32 queued;
> -	u32 dropped;
> -};
> -
> -struct mon_bin_get {
> -	struct mon_bin_hdr __user *hdr;	/* Can be 48 bytes or 64. */
> -	void __user *data;
> -	size_t alloc;		/* Length of data (can be zero) */
> -};
> -
> -struct mon_bin_mfetch {
> -	u32 __user *offvec;	/* Vector of events fetched */
> -	u32 nfetch;		/* Number of events to fetch (out: fetched) */
> -	u32 nflush;		/* Number of events to flush */
> -};
> -
> -#ifdef CONFIG_COMPAT
> -struct mon_bin_get32 {
> -	u32 hdr32;
> -	u32 data32;
> -	u32 alloc32;
> -};
> -
> -struct mon_bin_mfetch32 {
> -        u32 offvec32;
> -        u32 nfetch32;
> -        u32 nflush32;
> -};
> -#endif
> -
>  /* Having these two values same prevents wrapping of the mon_bin_hdr */
>  #define PKT_ALIGN   64
>  #define PKT_SIZE    64
> diff --git a/include/uapi/linux/usb/mon.h b/include/uapi/linux/usb/mon.h
> new file mode 100644
> index 000000000000..265e0169e2ef
> --- /dev/null
> +++ b/include/uapi/linux/usb/mon.h
> @@ -0,0 +1,102 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * USB Monitoring (usbmon) definitions

Put the copyright notices back in here.

> + */
> +
> +#ifndef __UAPI_LINUX_USB_MON_H
> +#define __UAPI_LINUX_USB_MON_H
> +
> +/* ioctl macros */
> +#define MON_IOC_MAGIC 0x92
> +
> +#define MON_IOCQ_URB_LEN _IO(MON_IOC_MAGIC, 1)
> +/* #2 used to be MON_IOCX_URB, removed before it got into Linus tree */
> +#define MON_IOCG_STATS _IOR(MON_IOC_MAGIC, 3, struct mon_bin_stats)
> +#define MON_IOCT_RING_SIZE _IO(MON_IOC_MAGIC, 4)
> +#define MON_IOCQ_RING_SIZE _IO(MON_IOC_MAGIC, 5)
> +#define MON_IOCX_GET   _IOW(MON_IOC_MAGIC, 6, struct mon_bin_get)
> +#define MON_IOCX_MFETCH _IOWR(MON_IOC_MAGIC, 7, struct mon_bin_mfetch)
> +#define MON_IOCH_MFLUSH _IO(MON_IOC_MAGIC, 8)
> +/* #9 was MON_IOCT_SETAPI */
> +#define MON_IOCX_GETX   _IOW(MON_IOC_MAGIC, 10, struct mon_bin_get)
> +
> +#ifdef CONFIG_COMPAT
> +#define MON_IOCX_GET32 _IOW(MON_IOC_MAGIC, 6, struct mon_bin_get32)
> +#define MON_IOCX_MFETCH32 _IOWR(MON_IOC_MAGIC, 7, struct mon_bin_mfetch32)
> +#define MON_IOCX_GETX32   _IOW(MON_IOC_MAGIC, 10, struct mon_bin_get32)
> +#endif

Alignment?

And you see the kbuild error for this, please fix that up.

> +
> +/* ioctl structures */
> +
> +/* per file statistic */
> +struct mon_bin_stats {
> +	u32 queued;
> +	u32 dropped;
> +};

As you are making this a "real" uapi .h file, you have to use the "real"
data types as well.  That means using __u32 and not u32.  Same for all
others.

> +
> +struct mon_bin_get {
> +	struct mon_bin_hdr __user *hdr;	/* Can be 48 bytes or 64. */
> +	void __user *data;

Does this cross the user/kernel boundry?  Ick, no wonder we need compat
fixups :(

> +	size_t alloc;		/* Length of data (can be zero) */
> +};
> +
> +struct mon_bin_mfetch {
> +	u32 __user *offvec;	/* Vector of events fetched */
> +	u32 nfetch;		/* Number of events to fetch (out: fetched) */
> +	u32 nflush;		/* Number of events to flush */
> +};
> +
> +#ifdef CONFIG_COMPAT
> +struct mon_bin_get32 {
> +	u32 hdr32;
> +	u32 data32;
> +	u32 alloc32;
> +};
> +
> +struct mon_bin_mfetch32 {
> +	u32 offvec32;
> +	u32 nfetch32;
> +	u32 nflush32;
> +};
> +#endif
> +
> +/* Data format */
> +
> +/*
> + * Defined by USB 2.0 clause 9.3, table 9.2.
> + */
> +#define SETUP_LEN  8

Horrible global define, please use USB_MON_SETUP_LEN or something like
that.


> +
> +/*
> + * The per-event API header (2 per URB).
> + *
> + * This structure is seen in userland as defined by the documentation.
> + */
> +struct mon_bin_hdr {
> +	u64 id;			/* URB ID - from submission to callback */
> +	unsigned char type;	/* Same as in text API; extensible. */
> +	unsigned char xfer_type;	/* ISO, Intr, Control, Bulk */
> +	unsigned char epnum;	/* Endpoint number and transfer direction */
> +	unsigned char devnum;	/* Device address */
> +	unsigned short busnum;	/* Bus number */
> +	char flag_setup;
> +	char flag_data;
> +	s64 ts_sec;		/* ktime_get_real_ts64 */
> +	s32 ts_usec;		/* ktime_get_real_ts64 */
> +	int status;
> +	unsigned int len_urb;	/* Length of data (submitted or actual) */
> +	unsigned int len_cap;	/* Delivered length */

Again, correct types please.

thanks,

greg k-h
