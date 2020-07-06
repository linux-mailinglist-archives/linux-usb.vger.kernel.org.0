Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D395215795
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 14:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729109AbgGFMto (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 08:49:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:38400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729095AbgGFMtn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 Jul 2020 08:49:43 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4222720715;
        Mon,  6 Jul 2020 12:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594039782;
        bh=LQUo0NV+eI+W7z6gihW6Lu9jt85M9acRbO0d0ne2tYY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VHCEoPuIz7s6EiaVBcOgfUVy3pbOutOb1pVjEjBAQrUMaiD/aEus0d+0hhegqEbFY
         FgumKCbMIszmt0I0nhBHdKPJzjO2byhPt4mXc9zSz0QaoJDQhzCYPCnyrhGX0ZSeAn
         VjphZ0H9tKOOB7psKxciuE8CtpRBAKprN1z8R2AE=
Date:   Mon, 6 Jul 2020 14:49:43 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Diego Elio =?iso-8859-1?Q?Petten=F2?= <flameeyes@flameeyes.com>
Cc:     linux-usb@vger.kernel.org, Pete Zaitcev <zaitcev@redhat.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Kris Katterjohn <katterjohn@gmail.com>
Subject: Re: [PATCH v2] usbmon: expose the usbmon structures and constants as
 an UAPI header.
Message-ID: <20200706124943.GA2270456@kroah.com>
References: <20200705150225.21500-1-flameeyes@flameeyes.com>
 <20200706121509.26439-1-flameeyes@flameeyes.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200706121509.26439-1-flameeyes@flameeyes.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 06, 2020 at 01:15:09PM +0100, Diego Elio Pettenò wrote:
> Previously any application wanting to implement the usbmon binary
> interfaces needed to re-declare the structures and constants, leading to
> structure duplication and confusion over whether these structures fall into
> the system call exception or not.
> 
> Cc: linux-usb@vger.kernel.org
> Cc: Pete Zaitcev <zaitcev@redhat.com>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Kris Katterjohn <katterjohn@gmail.com>
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Signed-off-by: Diego Elio Pettenò <flameeyes@flameeyes.com>
> ---
>  Documentation/usb/usbmon.rst |  64 ++++++++++-----------
>  drivers/usb/mon/mon_bin.c    |  92 +-----------------------------
>  include/uapi/linux/usb/mon.h | 105 +++++++++++++++++++++++++++++++++++
>  3 files changed, 139 insertions(+), 122 deletions(-)
>  create mode 100644 include/uapi/linux/usb/mon.h
> 
> diff --git a/Documentation/usb/usbmon.rst b/Documentation/usb/usbmon.rst
> index b0bd51080799..da18c5543b2f 100644
> --- a/Documentation/usb/usbmon.rst
> +++ b/Documentation/usb/usbmon.rst
> @@ -211,36 +211,38 @@ Bulk wrapper to a storage device at address 5::
>  Raw binary format and API
>  =========================
>  
> -The overall architecture of the API is about the same as the one above,
> -only the events are delivered in binary format. Each event is sent in
> -the following structure (its name is made up, so that we can refer to it)::
> -
> -  struct usbmon_packet {
> -	u64 id;			/*  0: URB ID - from submission to callback */
> -	unsigned char type;	/*  8: Same as text; extensible. */
> -	unsigned char xfer_type; /*    ISO (0), Intr, Control, Bulk (3) */
> -	unsigned char epnum;	/*     Endpoint number and transfer direction */
> -	unsigned char devnum;	/*     Device address */
> -	u16 busnum;		/* 12: Bus number */
> -	char flag_setup;	/* 14: Same as text */
> -	char flag_data;		/* 15: Same as text; Binary zero is OK. */
> -	s64 ts_sec;		/* 16: gettimeofday */
> -	s32 ts_usec;		/* 24: gettimeofday */
> -	int status;		/* 28: */
> -	unsigned int length;	/* 32: Length of data (submitted or actual) */
> -	unsigned int len_cap;	/* 36: Delivered length */
> -	union {			/* 40: */
> -		unsigned char setup[SETUP_LEN];	/* Only for Control S-type */
> +The overall architecture of the API is about the same as the one above, only the

Why change that line?

> +events are delivered in binary format. The structures and constants are defined
> +in linux/usb/mon.h.

Not your new uapi file location?

> +
> +Each event is sent in the following structure::
> +
> +  struct mon_bin_hdr {
> +	u64 id;		/*  0: URB ID - from submission to callback */

__u64, right?  Same for the rest of this file...

> +	u8 type;	/*  8: Same as text; extensible. */
> +	u8 xfer_type;	/*    ISO (0), Intr, Control, Bulk (3) */
> +	u8 epnum;	/*     Endpoint number and transfer direction */
> +	u8 devnum;	/*     Device address */
> +	u16 busnum;	/* 12: Bus number */
> +	s8 flag_setup;	/* 14: Same as text */
> +	s8 flag_data;	/* 15: Same as text; Binary zero is OK. */
> +	s64 ts_sec;	/* 16: gettimeofday */
> +	s32 ts_usec;	/* 24: gettimeofday */
> +	s32 status;		/* 28: */
> +	u32 length;	/* 32: Length of data (submitted or actual) */
> +	u32 len_cap;	/* 36: Delivered length */
> +	union {		/* 40: */
> +		u8 setup[MON_USB_SETUP_LEN];	/* Only for Control S-type */
>  		struct iso_rec {		/* Only for ISO */
> -			int error_count;
> -			int numdesc;
> +			s32 error_count;
> +			s32 numdesc;
>  		} iso;
>  	} s;
> -	int interval;		/* 48: Only for Interrupt and ISO */
> -	int start_frame;	/* 52: For ISO */
> -	unsigned int xfer_flags; /* 56: copy of URB's transfer_flags */
> -	unsigned int ndesc;	/* 60: Actual number of ISO descriptors */
> -  };				/* 64 total length */
> +	s32 interval;	/* 48: Only for Interrupt and ISO */
> +	s32 start_frame;/* 52: For ISO */
> +	u32 xfer_flags; /* 56: copy of URB's transfer_flags */
> +	u32 ndesc;	/* 60: Actual number of ISO descriptors */
> +  };			/* 64 total length */
>  
>  These events can be received from a character device by reading with read(2),
>  with an ioctl(2), or by accessing the buffer with mmap. However, read(2)
> @@ -313,9 +315,9 @@ This ioctl is primarily used when the application accesses the buffer
>  with mmap(2). Its argument is a pointer to the following structure::
>  
>    struct mon_mfetch_arg {
> -	uint32_t *offvec;	/* Vector of events fetched */
> -	uint32_t nfetch;	/* Number of events to fetch (out: fetched) */
> -	uint32_t nflush;	/* Number of events to flush */
> +	u32 *offvec;	/* Vector of events fetched */
> +	u32 nfetch;	/* Number of events to fetch (out: fetched) */
> +	u32 nflush;	/* Number of events to flush */

Again, __u32

>    };
>  
>  The ioctl operates in 3 stages.
> @@ -346,8 +348,6 @@ be polled with select(2) and poll(2). But lseek(2) does not work.
>  
>  * Memory-mapped access of the kernel buffer for the binary API
>  
> -The basic idea is simple:
> -

Why drop this?  If you want to clean up the documentation, wonderful,
but again, don't do that in the same patch.

Remember, each patch can only do ONE thing.


>  To prepare, map the buffer by getting the current size, then using mmap(2).
>  Then, execute a loop similar to the one written in pseudo-code below::
>  
> diff --git a/drivers/usb/mon/mon_bin.c b/drivers/usb/mon/mon_bin.c
> index f48a23adbc35..e1a7e69a3b0c 100644
> --- a/drivers/usb/mon/mon_bin.c
> +++ b/drivers/usb/mon/mon_bin.c
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
> @@ -396,7 +308,7 @@ static inline char mon_bin_get_setup(unsigned char *setupb,
>  
>  	if (urb->setup_packet == NULL)
>  		return 'Z';
> -	memcpy(setupb, urb->setup_packet, SETUP_LEN);
> +	memcpy(setupb, urb->setup_packet, MON_USB_SETUP_LEN);
>  	return 0;
>  }
>  
> diff --git a/include/uapi/linux/usb/mon.h b/include/uapi/linux/usb/mon.h
> new file mode 100644
> index 000000000000..376f93acdde2
> --- /dev/null
> +++ b/include/uapi/linux/usb/mon.h
> @@ -0,0 +1,105 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * USB Monitoring (usbmon) definitions
> + *
> + * See documentation in Documentation/usb/usbmon.rst.
> + *
> + * Copyright (C) 2006 Paolo Abeni (paolo.abeni@email.it)
> + * Copyright (C) 2006,2007 Pete Zaitcev (zaitcev@redhat.com)
> + */
> +
> +#ifndef __UAPI_LINUX_USB_MON_H
> +#define __UAPI_LINUX_USB_MON_H
> +
> +/* ioctl macros */
> +#define MON_IOC_MAGIC 0x92
> +
> +#define MON_IOCQ_URB_LEN	_IO(MON_IOC_MAGIC, 1)
> +/* #2 used to be MON_IOCX_URB, removed before it got into Linus tree */
> +#define MON_IOCG_STATS		_IOR(MON_IOC_MAGIC, 3, struct mon_bin_stats)
> +#define MON_IOCT_RING_SIZE	_IO(MON_IOC_MAGIC, 4)
> +#define MON_IOCQ_RING_SIZE	_IO(MON_IOC_MAGIC, 5)
> +#define MON_IOCX_GET		_IOW(MON_IOC_MAGIC, 6, struct mon_bin_get)
> +#define MON_IOCX_MFETCH		_IOWR(MON_IOC_MAGIC, 7, struct mon_bin_mfetch)
> +#define MON_IOCH_MFLUSH		_IO(MON_IOC_MAGIC, 8)
> +/* #9 was MON_IOCT_SETAPI */
> +#define MON_IOCX_GETX		_IOW(MON_IOC_MAGIC, 10, struct mon_bin_get)
> +
> +/* ioctl structures */
> +
> +/* per file statistic */
> +struct mon_bin_stats {
> +	__u32 queued;
> +	__u32 dropped;
> +};
> +
> +struct mon_bin_get {
> +	struct mon_bin_hdr __user *hdr;	/* Can be 48 bytes or 64. */
> +	void __user *data;
> +	size_t alloc;		/* Length of data (can be zero) */

is size_t a value we can pass across user/kernel boundry?  Are you sure
this isn't __kernel_size_t?

thanks,

greg k-h
