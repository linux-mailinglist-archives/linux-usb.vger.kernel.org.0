Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 001C1489027
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 07:25:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbiAJGZF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 01:25:05 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:20346 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230352AbiAJGZF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 01:25:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1641795905; x=1673331905;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wTwaPiZXVRjc/U2cNSTOIIQedzJPycuZctOd2rex6B4=;
  b=N+vyNGuka6n+OSTQ4ZPDfSbOl7oElyHyLrc5JBWB51EhrCYbyELgeHfp
   AdKlvhOOeJaqYFgnz/PoFgt8TUhvmmLuaWtYgDTuwYzEC9GRIcxgtOTKk
   +qaa96UvMSkyepLVhfFOk4Df3Vx2o3hOuTalsiAu6boxC7Kcu/KBWEe/r
   g=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 09 Jan 2022 22:25:04 -0800
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2022 22:25:04 -0800
Received: from jackp-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 9 Jan 2022 22:25:04 -0800
From:   Jack Pham <quic_jackp@quicinc.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Roger Quadros <rogerq@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Michal Nazarewicz <mina86@mina86.com>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>
Subject: [PATCH 0/1] usb: gadget: f_mass_storage: Make CD-ROM emulation work with Mac OS-X
Date:   Sun, 9 Jan 2022 22:23:58 -0800
Message-ID: <20220110062359.5314-1-quic_jackp@quicinc.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

This is a resurrection of a *very* old patch [1] from 2011 that apparently
never landed upstream.

One of our customers is reporting exactly the failure described in $SUBJECT,
and mentioned that applying this change in their downstream kernel allows
their mass storage function to successfully connect to OS X hosts.  So
perhaps we can finally try to merge it, better late than never.

The original series was applicable to both the mass_storage and now-defunct
file_storage gadget functions.  So I've simply squashed the changes into a
single patch applicable to f_mass_storage.c

@Roger I've kept the authorship email from your original submission since
it was retained from "git am".  I'm not sure if it's ok/appropriate to update
it to your current @kernel.org address?

[1] https://lore.kernel.org/lkml/1302015569-9668-1-git-send-email-roger.quadros@nokia.com/T/#u

Roger Quadros (1):
  usb: gadget: f_mass_storage: Make CD-ROM emulation work with Mac OS-X

 drivers/usb/gadget/function/f_mass_storage.c | 73 +++++++++++++++++++++++-----
 1 file changed, 61 insertions(+), 12 deletions(-)

-- 
2.7.4

