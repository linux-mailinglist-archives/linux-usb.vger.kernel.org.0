Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37F8E15927C
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2020 16:03:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728851AbgBKPDV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Feb 2020 10:03:21 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:58214 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727682AbgBKPDV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Feb 2020 10:03:21 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01BF2RFJ048777;
        Tue, 11 Feb 2020 15:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=ffyKD/vIxMZa1ZLneiehxRguK7IXuN31yOjhGNdio30=;
 b=g3Uc7oABtFmfztZolAbFHEjEIKdg7vTj5M3NhWILr+hVBGkU0e7/U/M9Wm09sok5kdqQ
 xLz2fLLFgmHbZGxEKCgkrM9Ku5rCKLVCex37IBWa/VUNf+RG0Ppxl3tg1x9xrVPWFazM
 JvvJpMyYAdzh09eYY4iWUlNs7kQFegOnAV/sT6XcK0WiTjQwU+Xcr3g6CV9dKn9ZHRR9
 Ds8QApbkzPOWbna4xozdH5AMXX0tRvaRMFjOqXmUebmpdUjnzzpv3y6IDAs5uXAonJnj
 U0mQB8mZBSuP2QyYzhAf0QLhD6Ay25mTrmHURSHrdP9qhTWEulQgY6grJ2ON4Yr0tc0i ug== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 2y2k883wk1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 11 Feb 2020 15:03:17 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01BEv3xC102735;
        Tue, 11 Feb 2020 15:03:17 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 2y26fhb33h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 11 Feb 2020 15:03:16 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 01BF3GBk004083;
        Tue, 11 Feb 2020 15:03:16 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 11 Feb 2020 07:03:15 -0800
Date:   Tue, 11 Feb 2020 18:03:09 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     linux-usb@vger.kernel.org
Cc:     john453@faraday-tech.com
Subject: [bug report] usb: host: Faraday fotg210-hcd driver
Message-ID: <20200211150308.rqjujcicbx5obxd2@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9527 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=1
 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0
 mlxlogscore=878 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002110112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9527 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 lowpriorityscore=0
 suspectscore=1 bulkscore=0 phishscore=0 mlxlogscore=939 mlxscore=0
 malwarescore=0 impostorscore=0 clxscore=1011 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002110112
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello USB devs,

The patch 7d50195f6c50: "usb: host: Faraday fotg210-hcd driver" from
Jul 29, 2013, leads to the following static checker warning:

	drivers/usb/host/fotg210-hcd.c:3945 iso_stream_init()
	warn: mask and shift to zero

drivers/usb/host/fotg210-hcd.c
  3922  static void iso_stream_init(struct fotg210_hcd *fotg210,
  3923                  struct fotg210_iso_stream *stream, struct usb_device *dev,
  3924                  int pipe, unsigned interval)
  3925  {
  3926          u32 buf1;
  3927          unsigned epnum, maxp;
  3928          int is_input;
  3929          long bandwidth;
  3930          unsigned multi;
  3931  
  3932          /*
  3933           * this might be a "high bandwidth" highspeed endpoint,
  3934           * as encoded in the ep descriptor's wMaxPacket field
  3935           */
  3936          epnum = usb_pipeendpoint(pipe);
  3937          is_input = usb_pipein(pipe) ? USB_DIR_IN : 0;
  3938          maxp = usb_maxpacket(dev, pipe, !is_input);
  3939          if (is_input)
  3940                  buf1 = (1 << 11);
  3941          else
  3942                  buf1 = 0;
  3943  
  3944          maxp = max_packet(maxp);
  3945          multi = hb_mult(maxp);
  3946          buf1 |= maxp;
  3947          maxp *= multi;
  3948  
  3949          stream->buf0 = cpu_to_hc32(fotg210, (epnum << 8) | dev->devnum);
  3950          stream->buf1 = cpu_to_hc32(fotg210, buf1);
  3951          stream->buf2 = cpu_to_hc32(fotg210, multi);

The problem is these two defines:

#define max_packet(wMaxPacketSize) ((wMaxPacketSize) & 0x07ff)
#define hb_mult(wMaxPacketSize) (1 + (((wMaxPacketSize) >> 11) & 0x03))

0x07ff >> 11 is always zero so multi is always 1.

Should we pass the original value that usb_maxpacket() returned instead
of the masked value?

regards,
dan carpenter
