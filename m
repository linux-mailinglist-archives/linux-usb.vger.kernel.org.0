Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDA8412124
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2019 19:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbfEBRfS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 May 2019 13:35:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:40366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726434AbfEBRfS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 2 May 2019 13:35:18 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 40FAA205F4;
        Thu,  2 May 2019 17:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556818517;
        bh=glrT0xD7Wxbz120lJjL1WLCfrPCvj2RcVULiKr403Yg=;
        h=Date:From:To:Cc:Subject:From;
        b=TzkqqI7I+fD68sIMDA92bE2UoRip6Ms2WRflI1vrbe85Oii5n0WvlKjONm9HObqUH
         4uTX7gQ2ff9LnKv5KGuD/Ltd/ySSeQETwZcfVI0rJXMu7Vm/rMp0K3Vd3y9LGRWzot
         ypGJGmiPxQljrxd7G0uk0m9SyJVbZ0GuXmsaVqmQ=
Date:   Thu, 2 May 2019 19:35:15 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] USB: serial: io_edgeport: fix up switch fall-through comments
Message-ID: <20190502173515.GA13801@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Gustavo has been working to fix up all of the switch statements that
"fall through" such that we can eventually turn on
-Wimplicit-fallthrough.  As part of that, the io_edgeport.c driver is a
bit "messy" with the parsing logic of a data packet.  Clean that logic
up a bit by unindenting one level of the logic, and properly label
/* Fall through */ to make gcc happy.

Reported-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
index 4ca31c0e4174..48a439298a68 100644
--- a/drivers/usb/serial/io_edgeport.c
+++ b/drivers/usb/serial/io_edgeport.c
@@ -1751,7 +1751,7 @@ static void process_rcvd_data(struct edgeport_serial *edge_serial,
 				edge_serial->rxState = EXPECT_HDR2;
 				break;
 			}
-			/* otherwise, drop on through */
+			/* Fall through */
 		case EXPECT_HDR2:
 			edge_serial->rxHeader2 = *buffer;
 			++buffer;
@@ -1790,29 +1790,20 @@ static void process_rcvd_data(struct edgeport_serial *edge_serial,
 						edge_serial->rxHeader2, 0);
 				edge_serial->rxState = EXPECT_HDR1;
 				break;
-			} else {
-				edge_serial->rxPort =
-				    IOSP_GET_HDR_PORT(edge_serial->rxHeader1);
-				edge_serial->rxBytesRemaining =
-				    IOSP_GET_HDR_DATA_LEN(
-						edge_serial->rxHeader1,
-						edge_serial->rxHeader2);
-				dev_dbg(dev, "%s - Data for Port %u Len %u\n",
-					__func__,
-					edge_serial->rxPort,
-					edge_serial->rxBytesRemaining);
-
-				/* ASSERT(DevExt->RxPort < DevExt->NumPorts);
-				 * ASSERT(DevExt->RxBytesRemaining <
-				 *		IOSP_MAX_DATA_LENGTH);
-				 */
-
-				if (bufferLength == 0) {
-					edge_serial->rxState = EXPECT_DATA;
-					break;
-				}
-				/* Else, drop through */
 			}
+
+			edge_serial->rxPort = IOSP_GET_HDR_PORT(edge_serial->rxHeader1);
+			edge_serial->rxBytesRemaining = IOSP_GET_HDR_DATA_LEN(edge_serial->rxHeader1,
+									      edge_serial->rxHeader2);
+			dev_dbg(dev, "%s - Data for Port %u Len %u\n", __func__,
+				edge_serial->rxPort,
+				edge_serial->rxBytesRemaining);
+
+			if (bufferLength == 0) {
+				edge_serial->rxState = EXPECT_DATA;
+				break;
+			}
+			/* Fall through */
 		case EXPECT_DATA: /* Expect data */
 			if (bufferLength < edge_serial->rxBytesRemaining) {
 				rxLen = bufferLength;
