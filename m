Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EFA2444A6C
	for <lists+linux-usb@lfdr.de>; Wed,  3 Nov 2021 22:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231282AbhKCVpu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Nov 2021 17:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231305AbhKCVpq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Nov 2021 17:45:46 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63A6C061203
        for <linux-usb@vger.kernel.org>; Wed,  3 Nov 2021 14:43:08 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id d21so7884922lfg.7
        for <linux-usb@vger.kernel.org>; Wed, 03 Nov 2021 14:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0CHiL14FG+Kgzes/8ShUvHjws5SrHWsHWKscjqEjkps=;
        b=PX01PezvXXbTky5OsR4KYa31pg1oFJbHFB0s7meK8vSxWyJjbqLfcloI0wvIt4GR+I
         USR288yae9HktD4GKIbyWszGboYR8vKpNFPOSv9CCD5Pge5PO4ZecFwzh7LL3GOHDveW
         Kx66saLMYT1yNcskC+05Ll0EYbDI1/+P0H4z0XCG8UOqiYDriJbqTpJ2FTYUWms+r9dT
         5pLFDLOb4nZKiIY/OCnQDa/EfgK99N8ObBUSkYtww82+pQnr+rvpFIViRhqiuVRBiOIz
         tgSvLuzEwHYT15vPvYW/xxcMBnEOoNXhZ7KN55EDOzxJx94WebGTV74S11+JKwAOnox3
         dasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0CHiL14FG+Kgzes/8ShUvHjws5SrHWsHWKscjqEjkps=;
        b=AIEOUkf7LTRA1r2dVLoeVvc/WuC4rw5S/7BywMVcEdO8+pXInZBNl4Fp4foDcuhz5r
         k1R/TdnZdnIHM4Mg4yIlTocSPfMCcCwewMARIBPX8UweHJH1KwJq9pC94hYpUE4Gm4B3
         HZ5nycIlXV/oK1BCZ5bXnZb0SJkM76KM0jROtBvXJm32fN55YQxHIbCMvmLVeQSqdbby
         rK+Fxtk4O6zJNdQNFn+mSnIkJ5Sj4WHqy0YOAbyBMcWwNGaQNvdzYiLBW7aU5PxBiPYN
         DqzAavVJPEAK1DtcHk1rUvrsCGnPJV1woFbitDcB7Sg2OjsucHRxx3cvBYYSF+2WwPxE
         1kNg==
X-Gm-Message-State: AOAM5320WXUTGb9bPSMTpoBju2g4pwXE2hXf68UX5XgVy2kB/gcN3fZO
        qwwkYxztThZs4lDPH36lwtSrKAfnfFQ=
X-Google-Smtp-Source: ABdhPJzhYGwRVkhn3CE7UX4d69mcwbyU0TGnUpUItQxKbzwVoA0/pFsmN7A8wTwMVWd9nZGYOxPR/w==
X-Received: by 2002:a05:6512:16a4:: with SMTP id bu36mr43564802lfb.255.1635975787107;
        Wed, 03 Nov 2021 14:43:07 -0700 (PDT)
Received: from dell-precision-T3610 (h-155-4-132-193.NA.cust.bahnhof.se. [155.4.132.193])
        by smtp.gmail.com with ESMTPSA id e8sm276476lft.308.2021.11.03.14.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 14:43:06 -0700 (PDT)
Date:   Wed, 3 Nov 2021 22:43:05 +0100
From:   Lars Gunnarsson <gunnarsson.lars@gmail.com>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 3/3] tools/usbip: import USB devices on a given bus
 persistently
Message-ID: <20211103214305.GC7819@dell-precision-T3610>
References: <20211027193208.GA16461@dell-precision-T3610>
 <8cbc6034-274c-3a12-d23f-2473ba1b885d@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cbc6034-274c-3a12-d23f-2473ba1b885d@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks for the comments, below are my responses.

On Wed, Oct 27, 2021 at 05:58:23PM -0600, Shuah Khan wrote:
> On 10/27/21 1:32 PM, Lars Gunnarsson wrote:
> > This patch extends the command "usbip attach" with flag "-p|--persistent". When
> > this flag is used, devices on the given remote busid is imported when available,
> > instead of returning an error if the device is not exported. When the usb device is
> > unplugged, it will start monitor the given remote bus again. Increment protocol
> > version to 1.1.2 (0x112) since this patch affects both ends: usbipd (server)
> > and command "usbip attach" (client).
> 
> Make the commit log 75 char long. A maximum 75 chars per line is prefered

Will fix this.

> > 
> > Signed-off-by: Lars Gunnarsson <gunnarsson.lars@gmail.com>
> > ---
> > v2: Change title, fix style warnings, improve feature description, refactor
> >      cmdline flag usage.
> > v3: Change title and description.
> > 
> >   Documentation/usb/usbip_protocol.rst  |  56 +++++++++--
> 
> Cosolidate documentation changes in a single separate patch.
> You have doc changes in patch 2&3. Make this as the first
> patch - it will be easier to review.

Will add documentation updates as a separate patch [1/4].

> 
> >   tools/usb/usbip/configure.ac          |   2 +-
> >   tools/usb/usbip/libsrc/usbip_common.c |   1 +
> >   tools/usb/usbip/libsrc/usbip_common.h |   1 +
> >   tools/usb/usbip/libsrc/vhci_driver.c  |  16 ++++
> >   tools/usb/usbip/libsrc/vhci_driver.h  |   1 +
> >   tools/usb/usbip/src/usbip_attach.c    | 132 +++++++++++++++++++-------
> >   tools/usb/usbip/src/usbip_network.h   |   2 +
> >   tools/usb/usbip/src/usbipd.c          |  92 ++++++++++++++++--
> >   9 files changed, 251 insertions(+), 52 deletions(-)
> > 
> > diff --git a/Documentation/usb/usbip_protocol.rst b/Documentation/usb/usbip_protocol.rst
> > index 2ed7d97278e8..1afe6d297efc 100644
> > --- a/Documentation/usb/usbip_protocol.rst
> > +++ b/Documentation/usb/usbip_protocol.rst
> > @@ -36,12 +36,7 @@ TCP/IP connection is closed.
> > 
> >   Once the client knows the list of exported USB devices it may decide to use one
> >   of them. First the client opens a TCP/IP connection to the server and
> > -sends an OP_REQ_IMPORT packet. The server replies with OP_REP_IMPORT. If the
> > -import was successful the TCP/IP connection remains open and will be used
> > -to transfer the URB traffic between the client and the server. The client may
> > -send two types of packets: the USBIP_CMD_SUBMIT to submit an URB, and
> > -USBIP_CMD_UNLINK to unlink a previously submitted URB. The answers of the
> > -server may be USBIP_RET_SUBMIT and USBIP_RET_UNLINK respectively.
> > +sends an OP_REQ_IMPORT packet. The server replies with OP_REP_IMPORT.
> > 
> >   ::
> > 
> > @@ -55,6 +50,47 @@ server may be USBIP_RET_SUBMIT and USBIP_RET_UNLINK respectively.
> >             |                  OP_REP_IMPORT                  |
> >             | <---------------------------------------------- |
> >             |                                                 |
> > +
> > +The client may also request to poll for devices to become exported on a given
> > +busid, instead of immediately receive an error. If no device becomes exported
> > +within the chosen time, the server replies with timeout. The TCP/IP connection
> > +remains open and subsequent poll requests can be sent.
> > +
> > +::
> > +
> > + virtual host controller                                 usb host
> > +      "client"                                           "server"
> > +  (imports USB devices)                             (exports USB devices)
> > +          |                                                 |
> > +          |                  OP_REQ_IMPORT                  |
> > +          | ----------------------------------------------> |
> > +          |                        .                        |
> > +          |                        :                        |
> > +          |                                                 |
> > +          |                  OP_REP_IMPORT                  |
> > +          | <---------------------------------------------- |
> > +          |                                                 |
> > +          |                  OP_REQ_IMPORT                  |
> > +          | ----------------------------------------------> |
> > +          |                        .                        |
> > +          |                        :                        |
> > +          |                                                 |
> > +          |                  OP_REP_IMPORT                  |
> > +          | <---------------------------------------------- |
> > +          |                        .                        |
> > +          |                        :                        |
> > +
> > +If the import was successful the TCP/IP connection remains open and will be used
> > +to transfer the URB traffic between the client and the server. The client may
> > +send two types of packets: the USBIP_CMD_SUBMIT to submit an URB, and
> > +USBIP_CMD_UNLINK to unlink a previously submitted URB. The answers of the
> > +server may be USBIP_RET_SUBMIT and USBIP_RET_UNLINK respectively.
> > +
> > +::
> > +
> > + virtual host controller                                 usb host
> > +      "client"                                           "server"
> > +  (imports USB devices)                             (exports USB devices)
> >             |                                                 |
> >             |            USBIP_CMD_SUBMIT(seqnum = n)         |
> >             | ----------------------------------------------> |
> > @@ -137,8 +173,8 @@ byte (MSB) is stored at the lowest address.
> >   Protocol Version
> >   ================
> > 
> > -The documented USBIP version is v1.1.1. The binary representation of this
> > -version in message headers is 0x0111.
> > +The documented USBIP version is v1.1.2. The binary representation of this
> > +version in message headers is 0x0112.
> > 
> >   This is defined in tools/usb/usbip/configure.ac
> > 
> > @@ -248,6 +284,10 @@ OP_REQ_IMPORT:
> >   |           |        |            | A string closed with zero, the unused bytes       |
> >   |           |        |            | shall be filled with zeros.                       |
> >   +-----------+--------+------------+---------------------------------------------------+
> > +| 40        | 4      |            | poll timeout: instead of returning immediately if |
> > +|           |        |            | device is not available, wait until usb device    |
> > +|           |        |            | becomes exported or a timeout occurs.             |
> > ++-----------+--------+------------+---------------------------------------------------+
> > 
> >   OP_REP_IMPORT:
> >   	Reply to import (attach) a remote USB device.
> > diff --git a/tools/usb/usbip/configure.ac b/tools/usb/usbip/configure.ac
> > index 607d05c5ccfd..156e42456423 100644
> > --- a/tools/usb/usbip/configure.ac
> > +++ b/tools/usb/usbip/configure.ac
> > @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
> > 
> >   AC_PREREQ(2.59)
> >   AC_INIT([usbip-utils], [2.0], [linux-usb@vger.kernel.org])
> > -AC_DEFINE([USBIP_VERSION], [0x00000111], [binary-coded decimal version number])
> > +AC_DEFINE([USBIP_VERSION], [0x00000112], [binary-coded decimal version number])
> > 
> >   CURRENT=0
> >   REVISION=1
> > diff --git a/tools/usb/usbip/libsrc/usbip_common.c b/tools/usb/usbip/libsrc/usbip_common.c
> > index b8d7d480595a..30efb6a9f76d 100644
> > --- a/tools/usb/usbip/libsrc/usbip_common.c
> > +++ b/tools/usb/usbip/libsrc/usbip_common.c
> > @@ -78,6 +78,7 @@ static struct op_common_status_string op_common_status_strings[] = {
> >   	{ ST_DEV_ERR,	"Device in error state" },
> >   	{ ST_NODEV,	"Device not found" },
> >   	{ ST_ERROR,	"Unexpected response" },
> > +	{ ST_POLL_TIMEOUT,	"Poll timeout" },
> >   	{ 0, NULL}
> >   };
> > 
> > diff --git a/tools/usb/usbip/libsrc/usbip_common.h b/tools/usb/usbip/libsrc/usbip_common.h
> > index 13f1d4ca47c5..3df351877a33 100644
> > --- a/tools/usb/usbip/libsrc/usbip_common.h
> > +++ b/tools/usb/usbip/libsrc/usbip_common.h
> > @@ -53,6 +53,7 @@
> >   #define ST_DEV_ERR	0x03
> >   #define ST_NODEV	0x04
> >   #define ST_ERROR	0x05
> > +#define ST_POLL_TIMEOUT 0x06
> > 
> >   extern int usbip_use_syslog;
> >   extern int usbip_use_stderr;
> > diff --git a/tools/usb/usbip/libsrc/vhci_driver.c b/tools/usb/usbip/libsrc/vhci_driver.c
> > index 8159fd98680b..4fc75e8bad66 100644
> > --- a/tools/usb/usbip/libsrc/vhci_driver.c
> > +++ b/tools/usb/usbip/libsrc/vhci_driver.c
> > @@ -465,3 +465,19 @@ int usbip_vhci_imported_device_dump(struct usbip_imported_device *idev)
> > 
> >   	return 0;
> >   }
> > +
> > +int usbip_vhci_get_local_busid_from(int port, char *local_busid)
> > +{
> > +	int rc = -1;
> > +
> > +	for (int i = 0; i < vhci_driver->nports; ++i) {
> > +		struct usbip_imported_device *idev = &vhci_driver->idev[i];
> > +
> > +		if (idev->port == port && strnlen(idev->udev.busid, SYSFS_BUS_ID_SIZE)) {
> > +			memcpy(local_busid, idev->udev.busid, SYSFS_BUS_ID_SIZE);
> > +			rc = 0;
> > +			break;
> > +		}
> > +	}
> > +	return rc;
> > +}
> > diff --git a/tools/usb/usbip/libsrc/vhci_driver.h b/tools/usb/usbip/libsrc/vhci_driver.h
> > index 6c9aca216705..4aecd4013cbe 100644
> > --- a/tools/usb/usbip/libsrc/vhci_driver.h
> > +++ b/tools/usb/usbip/libsrc/vhci_driver.h
> > @@ -63,5 +63,6 @@ int usbip_vhci_attach_device(uint8_t port, int sockfd, uint8_t busnum,
> >   int usbip_vhci_detach_device(uint8_t port);
> > 
> >   int usbip_vhci_imported_device_dump(struct usbip_imported_device *idev);
> > +int usbip_vhci_get_local_busid_from(int port, char *local_busid);
> > 
> >   #endif /* __VHCI_DRIVER_H */
> > diff --git a/tools/usb/usbip/src/usbip_attach.c b/tools/usb/usbip/src/usbip_attach.c
> > index b4aeb9f1f493..231c3896864b 100644
> > --- a/tools/usb/usbip/src/usbip_attach.c
> > +++ b/tools/usb/usbip/src/usbip_attach.c
> > @@ -12,6 +12,7 @@
> >   #include <limits.h>
> >   #include <stdint.h>
> >   #include <stdio.h>
> > +#include <stdbool.h>
> >   #include <string.h>
> > 
> >   #include <fcntl.h>
> > @@ -21,14 +22,23 @@
> > 
> >   #include "vhci_driver.h"
> >   #include "usbip_common.h"
> > +#include "usbip_monitor.h"
> >   #include "usbip_network.h"
> >   #include "usbip.h"
> > 
> > +struct attach_options {
> > +	char *busid;
> > +	bool is_persistent;
> > +};
> > +
> >   static const char usbip_attach_usage_string[] =
> >   	"usbip attach <args>\n"
> >   	"    -r, --remote=<host>      The machine with exported USB devices\n"
> > -	"    -b, --busid=<busid>    Busid of the device on <host>\n"
> > -	"    -d, --device=<devid>    Id of the virtual UDC on <host>\n";
> > +	"    -b, --busid=<busid>      Busid of the device on <host>\n"
> 
> Waht's the change here? Looks the same.

Aligning the text for prettier console output.

> 
> > +	"    -d, --device=<devid>     Id of the virtual UDC on <host>\n"
> > +	"    -p, --persistent         Persistently monitor the given bus and import\n"
> > +	"                             USB devices when available on the remote end\n";
> > +
> > 
> >   void usbip_attach_usage(void)
> >   {
> > @@ -117,7 +127,7 @@ static int import_device(int sockfd, struct usbip_usb_device *udev)
> >   	return -1;
> >   }
> > 
> > -static int query_import_device(int sockfd, char *busid)
> > +static int query_import_device(int sockfd, char *busid, bool is_persistent)
> >   {
> >   	int rc;
> >   	struct op_import_request request;
> > @@ -127,31 +137,35 @@ static int query_import_device(int sockfd, char *busid)
> > 
> >   	memset(&request, 0, sizeof(request));
> >   	memset(&reply, 0, sizeof(reply));
> > -
> > -	/* send a request */
> > -	rc = usbip_net_send_op_common(sockfd, OP_REQ_IMPORT, 0);
> > -	if (rc < 0) {
> > -		err("send op_common");
> > -		return -1;
> > -	}
> > -
> >   	strncpy(request.busid, busid, SYSFS_BUS_ID_SIZE-1);
> > +	if (is_persistent) {
> > +		request.poll_timeout_ms = 5000;
> > +		info("remote device on busid %s: polling", busid);
> > +	}
> > +	PACK_OP_IMPORT_REQUEST(1, &request);
> > 
> > -	PACK_OP_IMPORT_REQUEST(0, &request);
> > +	do {
> > +		/* send a request */
> > +		rc = usbip_net_send_op_common(sockfd, OP_REQ_IMPORT, 0);
> > +		if (rc < 0) {
> > +			err("send op_common");
> > +			return -1;
> > +		}
> > 
> > -	rc = usbip_net_send(sockfd, (void *) &request, sizeof(request));
> > -	if (rc < 0) {
> > -		err("send op_import_request");
> > -		return -1;
> > -	}
> > +		rc = usbip_net_send(sockfd, (void *) &request, sizeof(request));
> > +		if (rc < 0) {
> > +			err("send op_import_request");
> > +			return -1;
> > +		}
> > 
> > -	/* receive a reply */
> > -	rc = usbip_net_recv_op_common(sockfd, &code, &status);
> > -	if (rc < 0) {
> > -		err("Attach Request for %s failed - %s\n",
> > -		    busid, usbip_op_common_status_string(status));
> > -		return -1;
> > -	}
> > +		/* receive a reply */
> > +		rc = usbip_net_recv_op_common(sockfd, &code, &status);
> > +		if (status != ST_POLL_TIMEOUT && rc < 0) {
> > +			err("Attach Request for %s failed - %s\n",
> > +					busid, usbip_op_common_status_string(status));
> > +			return -1;
> > +		}
> > +	} while (status == ST_POLL_TIMEOUT);
> > 
> >   	rc = usbip_net_recv(sockfd, (void *) &reply, sizeof(reply));
> >   	if (rc < 0) {
> > @@ -171,7 +185,17 @@ static int query_import_device(int sockfd, char *busid)
> >   	return import_device(sockfd, &reply.udev);
> >   }
> > 
> > -static int attach_device(char *host, char *busid)
> > +static int get_local_busid_from(int port, char *local_busid)
> > +{
> > +	int rc = usbip_vhci_driver_open();
> > +
> > +	if (rc == 0)
> > +		rc = usbip_vhci_get_local_busid_from(port, local_busid);
> > +	usbip_vhci_driver_close();
> > +	return rc;
> > +}
> > +
> > +static int attach_device(char *host, struct attach_options opt)
> >   {
> >   	int sockfd;
> >   	int rc;
> > @@ -183,19 +207,53 @@ static int attach_device(char *host, char *busid)
> >   		return -1;
> >   	}
> > 
> > -	rhport = query_import_device(sockfd, busid);
> > +	rhport = query_import_device(sockfd, opt.busid, opt.is_persistent);
> >   	if (rhport < 0)
> >   		return -1;
> > 
> >   	close(sockfd);
> > 
> > -	rc = record_connection(host, usbip_port_string, busid, rhport);
> > +	rc = record_connection(host, usbip_port_string, opt.busid, rhport);
> >   	if (rc < 0) {
> >   		err("record connection");
> 
> This is cryptic. Please print more information to be useful.

Will fix this.

> 
> >   		return -1;
> >   	}
> > +	info("remote device on busid %s: attach complete", opt.busid);
> > +	return rhport;
> > +}
> > 
> > -	return 0;
> > +static void monitor_disconnect(usbip_monitor_t *monitor, char *busid, int rhport)
> > +{
> > +	// To monitor unbind we must first ensure to be at a bound state. To
> > +	// monitor bound state a local busid is needed, which is unknown at this
> > +	// moment. Local busid is not available until it's already bound to the usbip
> > +	// driver. Thus monitor bind events for any usb device until the busid is
> > +	// available for the port.
> > +	char local_busid[SYSFS_BUS_ID_SIZE] = {};
> > +
> > +	while (get_local_busid_from(rhport, local_busid))
> > +		usbip_monitor_await_usb_bind(monitor, USBIP_USB_DRV_NAME);
> > +	info("remote device on busid %s: monitor disconnect", busid);
> > +	usbip_monitor_set_busid(monitor, local_busid);
> > +	usbip_monitor_await_usb_unbind(monitor);
> > +	usbip_monitor_set_busid(monitor, NULL);
> > +}
> > +
> > +static int attach_device_persistently(char *host, struct attach_options opt)
> > +{
> > +	int rc = 0;
> > +	usbip_monitor_t *monitor = usbip_monitor_new();
> > +
> > +	while (rc == 0) {
> > +		int rhport = attach_device(host, opt);
> > +
> > +		if (rhport < 0)
> > +			rc = -1;
> > +		else
> > +			monitor_disconnect(monitor, opt.busid, rhport);
> > +	}
> > +	usbip_monitor_delete(monitor);
> > +	return rc;
> >   }
> > 
> >   int usbip_attach(int argc, char *argv[])
> > @@ -204,15 +262,16 @@ int usbip_attach(int argc, char *argv[])
> >   		{ "remote", required_argument, NULL, 'r' },
> >   		{ "busid",  required_argument, NULL, 'b' },
> >   		{ "device",  required_argument, NULL, 'd' },
> > +		{ "persistent",  no_argument, NULL, 'p' },
> >   		{ NULL, 0,  NULL, 0 }
> >   	};
> >   	char *host = NULL;
> > -	char *busid = NULL;
> > +	struct attach_options options = {};
> >   	int opt;
> >   	int ret = -1;
> > 
> >   	for (;;) {
> > -		opt = getopt_long(argc, argv, "d:r:b:", opts, NULL);
> > +		opt = getopt_long(argc, argv, "d:r:b:p", opts, NULL);
> > 
> >   		if (opt == -1)
> >   			break;
> > @@ -223,17 +282,24 @@ int usbip_attach(int argc, char *argv[])
> >   			break;
> >   		case 'd':
> >   		case 'b':
> > -			busid = optarg;
> > +			options.busid = optarg;
> > +			break;
> > +		case 'p':
> > +			options.is_persistent = true;
> >   			break;
> >   		default:
> >   			goto err_out;
> >   		}
> >   	}
> > 
> > -	if (!host || !busid)
> > +	if (!host || !options.busid)
> >   		goto err_out;
> > 
> > -	ret = attach_device(host, busid);
> > +	if (options.is_persistent)
> > +		ret = attach_device_persistently(host, options);
> > +	else
> > +		ret = attach_device(host, options);
> > +
> >   	goto out;
> > 
> >   err_out:
> > diff --git a/tools/usb/usbip/src/usbip_network.h b/tools/usb/usbip/src/usbip_network.h
> > index 83b4c5344f72..1c25d06ab688 100644
> > --- a/tools/usb/usbip/src/usbip_network.h
> > +++ b/tools/usb/usbip/src/usbip_network.h
> > @@ -61,6 +61,7 @@ struct op_devinfo_reply {
> > 
> >   struct op_import_request {
> >   	char busid[SYSFS_BUS_ID_SIZE];
> > +	uint32_t poll_timeout_ms;
> >   } __attribute__((packed));
> > 
> >   struct op_import_reply {
> > @@ -69,6 +70,7 @@ struct op_import_reply {
> >   } __attribute__((packed));
> > 
> >   #define PACK_OP_IMPORT_REQUEST(pack, request)  do {\
> > +	(request)->poll_timeout_ms = usbip_net_pack_uint32_t(pack, (request)->poll_timeout_ms);\
> >   } while (0)
> > 
> >   #define PACK_OP_IMPORT_REPLY(pack, reply)  do {\
> > diff --git a/tools/usb/usbip/src/usbipd.c b/tools/usb/usbip/src/usbipd.c
> > index 48398a78e88a..42ebe073b966 100644
> > --- a/tools/usb/usbip/src/usbipd.c
> > +++ b/tools/usb/usbip/src/usbipd.c
> > @@ -22,6 +22,7 @@
> >   #include <arpa/inet.h>
> >   #include <sys/socket.h>
> >   #include <netinet/in.h>
> > +#include <stdbool.h>
> > 
> >   #ifdef HAVE_LIBWRAP
> >   #include <tcpd.h>
> > @@ -35,6 +36,7 @@
> >   #include "usbip_host_common.h"
> >   #include "usbip_device_driver.h"
> >   #include "usbip_common.h"
> > +#include "usbip_monitor.h"
> >   #include "usbip_network.h"
> >   #include "list.h"
> > 
> > @@ -88,13 +90,78 @@ static void usbipd_help(void)
> >   	printf("%s\n", usbipd_help_string);
> >   }
> > 
> > +static struct usbip_exported_device *get_exported_device(const char *busid)
> > +{
> > +	struct usbip_exported_device *exported_dev = NULL;
> > +	struct usbip_exported_device *edev = NULL;
> > +	struct list_head *i;
> > +
> > +	list_for_each(i, &driver->edev_list) {
> > +		edev = list_entry(i, struct usbip_exported_device, node);
> > +		if (!strncmp(busid, edev->udev.busid, SYSFS_BUS_ID_SIZE)) {
> > +			exported_dev = edev;
> > +			break;
> > +		}
> > +	}
> > +	return exported_dev;
> > +}
> > +
> > +static bool await_requested_device(usbip_monitor_t *monitor,
> > +				   struct op_import_request *req)
> > +{
> > +	usbip_monitor_set_busid(monitor, req->busid);
> > +	usbip_monitor_set_timeout(monitor, req->poll_timeout_ms);
> > +	return usbip_monitor_await_usb_bind(monitor, "usbip-host");
> > +}
> > +
> > +static int recv_subsequent_poll_request(int sockfd, struct op_import_request *req)
> > +{
> > +	uint16_t code = OP_UNSPEC;
> > +	int status;
> > +	int rc = 0;
> > +
> > +	rc = usbip_net_recv_op_common(sockfd, &code, &status);
> > +	if (rc < 0) {
> > +		dbg("could not receive opcode: %#0x", code);
> > +		return -1;
> > +	}
> > +	if (code != OP_REQ_IMPORT) {
> > +		dbg("Only subsequent OP_REQ_IMPORT allowed when polling");
> > +		return -1;
> > +	}
> > +	rc = usbip_net_recv(sockfd, req, sizeof(struct op_import_request));
> > +	if (rc < 0) {
> > +		dbg("usbip_net_recv failed: subsequent OP_REQ_IMPORT request");
> 
> Same here. Make this message useful.

Will fix this.

> 
> > +		return -1;
> > +	}
> > +	PACK_OP_IMPORT_REQUEST(0, req);
> > +	return rc;
> > +}
> > +
> > +static int monitor_requested_busid(int sockfd, struct op_import_request *req)
> > +{
> > +	int rc = 0;
> > +	usbip_monitor_t *monitor = usbip_monitor_new();
> > +
> > +	while (!await_requested_device(monitor, req)) {
> > +		int status = ST_POLL_TIMEOUT;
> > +
> > +		rc = usbip_net_send_op_common(sockfd, OP_REP_IMPORT, status);
> > +		if (rc < 0) {
> > +			dbg("usbip_net_send_op_common failed: %#0x", OP_REP_IMPORT);
> > +			break;
> > +		}
> > +		rc = recv_subsequent_poll_request(sockfd, req);
> > +	}
> > +	usbip_monitor_delete(monitor);
> > +	return rc;
> > +}
> > +
> >   static int recv_request_import(int sockfd)
> >   {
> >   	struct op_import_request req;
> > -	struct usbip_exported_device *edev;
> > +	struct usbip_exported_device *edev = NULL;
> >   	struct usbip_usb_device pdu_udev;
> > -	struct list_head *i;
> > -	int found = 0;
> >   	int status = ST_OK;
> >   	int rc;
> > 
> > @@ -107,16 +174,21 @@ static int recv_request_import(int sockfd)
> >   	}
> >   	PACK_OP_IMPORT_REQUEST(0, &req);
> > 
> > -	list_for_each(i, &driver->edev_list) {
> > -		edev = list_entry(i, struct usbip_exported_device, node);
> > -		if (!strncmp(req.busid, edev->udev.busid, SYSFS_BUS_ID_SIZE)) {
> > -			info("found requested device: %s", req.busid);
> > -			found = 1;
> > -			break;
> > +	edev = get_exported_device(req.busid);
> > +
> > +	if (!edev && req.poll_timeout_ms) {
> > +		info("Client polling for devices on busid: %s", req.busid);
> > +		rc = monitor_requested_busid(sockfd, &req);
> > +		if (rc < 0) {
> > +			dbg("monitor_requested_busid failed");
> 
> Same here.

Will fix this.

> 
> > +			return -1;
> >   		}
> > +		usbip_refresh_device_list(driver);
> > +		edev = get_exported_device(req.busid);
> >   	}
> > 
> > -	if (found) {
> > +	if (edev) {
> > +		info("found requested device: %s", req.busid);
> >   		/* should set TCP_NODELAY for usbip */
> >   		usbip_net_set_nodelay(sockfd);
> > 
> > --
> > 2.25.1
> > 
> > 
> 
> thanks,
> -- Shuah
