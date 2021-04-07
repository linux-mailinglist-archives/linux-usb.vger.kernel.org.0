Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B467356A3E
	for <lists+linux-usb@lfdr.de>; Wed,  7 Apr 2021 12:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351489AbhDGKro (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Apr 2021 06:47:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:52804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351492AbhDGKrA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 7 Apr 2021 06:47:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 666606139C;
        Wed,  7 Apr 2021 10:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617792402;
        bh=Ltl/zxImFodnKg1Zy5Gf9VrHlde8OKGhBySHeRkZ3y4=;
        h=From:To:Cc:Subject:Date:From;
        b=qcOURa7fer3rNME1HItD8XRNoe/rPvTFEjMs5bWvHlT4j+VrOHvMso5QmFT7vFcgP
         NPRVWyKsUB5rLIBdofVgBCuOBOoemHRXQTecS8Y7wbMkfvNfbu0nbLiFwmFqwhUTFV
         FG3forAIfH73Aim263jrLPqAuPw6m8zYNfhT86c+gOTLSuEjY4k8u+RxAki5bWRstF
         hi1xuz1/eaXIOceMfC2ED4WbyU4+T1EvssEvCTVhSZErn+L3wpVeCy4hdf/9k6AF4b
         WWldrArjBHgTZNoxFf7G8QNnmTg8B7YjR9DdoajQbiCKZ/jAgRTl/IBgyCglD1yTag
         oP/o21vGDO18w==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lU5hj-0000KI-0S; Wed, 07 Apr 2021 12:46:35 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH] USB: serial: io_edgeport: drop unused definitions
Date:   Wed,  7 Apr 2021 12:46:29 +0200
Message-Id: <20210407104629.1212-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop unused definitions relating to a never mainlined custom
proc-interface and some likewise unused string descriptor definitions.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/io_edgeport.h | 68 --------------------------------
 1 file changed, 68 deletions(-)

diff --git a/drivers/usb/serial/io_edgeport.h b/drivers/usb/serial/io_edgeport.h
index 43ba53a3a6fa..7c9f62af5ed6 100644
--- a/drivers/usb/serial/io_edgeport.h
+++ b/drivers/usb/serial/io_edgeport.h
@@ -10,7 +10,6 @@
 #if !defined(_IO_EDGEPORT_H_)
 #define	_IO_EDGEPORT_H_
 
-
 #define MAX_RS232_PORTS		8	/* Max # of RS-232 ports per device */
 
 /* typedefs that the insideout headers need */
@@ -21,57 +20,8 @@
 	#define HIGH8(a)	((unsigned char)((a & 0xff00) >> 8))
 #endif
 
-#ifndef __KERNEL__
-#define __KERNEL__
-#endif
-
 #include "io_usbvend.h"
 
-
-
-/* The following table is used to map the USBx port number to
- * the device serial number (or physical USB path), */
-#define MAX_EDGEPORTS	64
-
-struct comMapper {
-	char	SerialNumber[MAX_SERIALNUMBER_LEN+1];	/* Serial number/usb path */
-	int	numPorts;				/* Number of ports */
-	int	Original[MAX_RS232_PORTS];		/* Port numbers set by IOCTL */
-	int	Port[MAX_RS232_PORTS];			/* Actual used port numbers */
-};
-
-
-#define EDGEPORT_CONFIG_DEVICE "/proc/edgeport"
-
-/* /proc/edgeport Interface
- * This interface uses read/write/lseek interface to talk to the edgeport driver
- * the following read functions are supported: */
-#define PROC_GET_MAPPING_TO_PATH	1
-#define PROC_GET_COM_ENTRY		2
-#define PROC_GET_EDGE_MANUF_DESCRIPTOR	3
-#define PROC_GET_BOOT_DESCRIPTOR	4
-#define PROC_GET_PRODUCT_INFO		5
-#define PROC_GET_STRINGS		6
-#define PROC_GET_CURRENT_COM_MAPPING	7
-
-/* The parameters to the lseek() for the read is: */
-#define PROC_READ_SETUP(Command, Argument)	((Command) + ((Argument)<<8))
-
-
-/* the following write functions are supported: */
-#define PROC_SET_COM_MAPPING		1
-#define PROC_SET_COM_ENTRY		2
-
-
-/* The following structure is passed to the write */
-struct procWrite {
-	int	Command;
-	union {
-		struct comMapper	Entry;
-		int			ComMappingBasedOnUSBPort;	/* Boolean value */
-	} u;
-};
-
 /*
  *	Product information read from the Edgeport
  */
@@ -108,22 +58,4 @@ struct edgeport_product_info {
 	struct edge_compatibility_bits Epic;
 };
 
-/*
- *	Edgeport Stringblock String locations
- */
-#define EDGESTRING_MANUFNAME		1	/* Manufacture Name */
-#define EDGESTRING_PRODNAME		2	/* Product Name */
-#define EDGESTRING_SERIALNUM		3	/* Serial Number */
-#define EDGESTRING_ASSEMNUM		4	/* Assembly Number */
-#define EDGESTRING_OEMASSEMNUM		5	/* OEM Assembly Number */
-#define EDGESTRING_MANUFDATE		6	/* Manufacture Date */
-#define EDGESTRING_ORIGSERIALNUM	7	/* Serial Number */
-
-struct string_block {
-	__u16	NumStrings;			/* Number of strings in block */
-	__u16	Strings[1];			/* Start of string block */
-};
-
-
-
 #endif
-- 
2.26.3

