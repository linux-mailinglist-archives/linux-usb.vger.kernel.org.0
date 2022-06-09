Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83FB754566E
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jun 2022 23:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236777AbiFIVYz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jun 2022 17:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235193AbiFIVYx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jun 2022 17:24:53 -0400
Received: from mx0b-0054a801.pphosted.com (mx0b-0054a801.pphosted.com [205.220.172.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 951AA394511
        for <linux-usb@vger.kernel.org>; Thu,  9 Jun 2022 14:24:49 -0700 (PDT)
Received: from pps.filterd (m0208805.ppops.net [127.0.0.1])
        by mx0b-0054a801.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 259KF7k4023715
        for <linux-usb@vger.kernel.org>; Thu, 9 Jun 2022 20:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsara.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=samsaracom06092020;
 bh=fsize1LL6DRMFATJFP/MigYicgdzJfWPUSyxUH+2K98=;
 b=DnZi1tOpzbWjOhObvXhG+qZB3Bt9J0Kcf0m3vW+TMhg6xfXLgbHlRZXUgnjkdp+QFMJV
 nrngI4DrQ/j3MyMcx7/uYvucB7GdX3g3xyP4f2QcKu88DdDo/wEm8hCRF5U4qKj5Y1Vl
 EjU0SGQ9D9kRKXdXuPrjRBLsMP7ERGPT0F9vlxXRmYlcHidgsP9EhAphOyqE0Ln+Kdaf
 5z5T4Hztx531hAsEElpALR6yDeivZ0mOQ9v1H1JHYccib64ZWz/COjFfDbqcC0NIarK9
 XIAHqVcxElTSXuXNts4/6/6wGtxVs6O6LnM2gM1QAQO4XpfOPVpulHUPbhh4bdTzjZPy Vw== 
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
        by mx0b-0054a801.pphosted.com (PPS) with ESMTPS id 3gg0g9mm6q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <linux-usb@vger.kernel.org>; Thu, 09 Jun 2022 20:48:04 +0000
Received: by mail-qt1-f198.google.com with SMTP id m19-20020a05622a055300b002f940281f18so19526529qtx.22
        for <linux-usb@vger.kernel.org>; Thu, 09 Jun 2022 13:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=samsara.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fsize1LL6DRMFATJFP/MigYicgdzJfWPUSyxUH+2K98=;
        b=fFeey2SOBlqmC/Q0z5OwTjAhXmN7RAWXgdaqgrSjDcKbHLPmMAGIpnG+xyd2eii51M
         mcMpZxAkNA7srCyIJambE3qCtMWCEUF5hben59GPzw4cLLakiOxpW/WWrLqeY+9hkV6y
         TeDLqSJd7iiVPp/jCs+UtYi8mW/O5Or7DLLhkF87rgGM6BtQYouW8kCFdSYqrqb2Y98z
         JFn30EqPFvPtwHZI6brPG0/VqdeJ3a4XJKdIIL8I+LDqNqtw8eOzoZF7w/4xbI/1f/GF
         YMoOzq0TjaGO/2eSIalZ/CjbX4OzuyDpEuxmoOruVQQfiGO6q67sRDl2KDLZ50S59PUJ
         I47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fsize1LL6DRMFATJFP/MigYicgdzJfWPUSyxUH+2K98=;
        b=G1yHZrVOfNgF5JGFoHvx5cSM1XacERHUDDwNmFepvV+HCGmrL0Oz+focPKnhj4fLbj
         X+MBRyDXUTNRCVASKWMvEVOplAxP1tDdbKccx0DITaXv48MBRzZrVGFe8PzdjIiITqbV
         pb1CW1JQ94tfQW5iyTjUrb9A6Q+xAKEdxJUqGt3apIzjK3aiURl6NLQdVjb0PwGFsQs+
         1YSAot8H2COZNAjaRDp0k2TQHkf6JCeJs3IBNJm4pXnshso+rHVHNewA4KcA9HS1fJBC
         ynBEIWw6WiS4ae7HBIUb85NspJRgRA7F2JLPdWwPo/KkFCDcFQefUZKxu6Gd7QMoUHAS
         vqHA==
X-Gm-Message-State: AOAM530OT4K4yAv/mKQpcNL4M0DRgImhSdg6BWoJvedeFG350IyIEugj
        dDAnAXy8BLnZeNxkD7AvxmnURx8v7H0nD16VJeUysnEZmRCiEfxLuABz9ajgLiKXO785RvCFuoT
        rxPK7tGgafZCov7xf6iMf
X-Received: by 2002:a05:620a:2283:b0:6a6:b80b:816a with SMTP id o3-20020a05620a228300b006a6b80b816amr16713446qkh.68.1654807683352;
        Thu, 09 Jun 2022 13:48:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7/O6twSwh9yuivcEaZJc5OJTmJUEIS6JGVqtvw6SZg40zaQUoRJYCIKZzOcXGRio6XUOkRw==
X-Received: by 2002:a05:620a:2283:b0:6a6:b80b:816a with SMTP id o3-20020a05620a228300b006a6b80b816amr16713425qkh.68.1654807683066;
        Thu, 09 Jun 2022 13:48:03 -0700 (PDT)
Received: from downhome.. (ec2-3-215-55-7.compute-1.amazonaws.com. [3.215.55.7])
        by smtp.gmail.com with ESMTPSA id d5-20020a05620a240500b006a6b1630e95sm5428568qkn.45.2022.06.09.13.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 13:48:02 -0700 (PDT)
From:   Rhett Aultman <rhett.aultman@samsara.com>
To:     linux-usb@vger.kernel.org, linux-can <linux-can@vger.kernel.org>
Cc:     Oliver Neukum <oneukum@suse.org>,
        Alan Stern <stern@roland.harvard.edu>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rhett Aultman <rhett.aultman@samsara.com>
Subject: [PATCH v2 2/3] drivers: usb/core/urb: allow URB_FREE_COHERENT
Date:   Thu,  9 Jun 2022 16:47:13 -0400
Message-Id: <20220609204714.2715188-3-rhett.aultman@samsara.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220609204714.2715188-1-rhett.aultman@samsara.com>
References: <alpine.DEB.2.22.394.2206031547001.1630869@thelappy>
 <20220609204714.2715188-1-rhett.aultman@samsara.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Dbik5ki29bELtky7hHkluCSjISHFqg2J
X-Proofpoint-ORIG-GUID: Dbik5ki29bELtky7hHkluCSjISHFqg2J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-09_15,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 mlxlogscore=519
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206090077
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The URB_FREE_COHERENT flag needs to be added to the allowed flags set in
order to prevent a "bogus flags" warning when it is used.

Signed-off-by: Rhett Aultman <rhett.aultman@samsara.com>
---
 drivers/usb/core/urb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index 1460fdac0b18..36c48fb196e0 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -507,7 +507,7 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
 
 	/* Check against a simple/standard policy */
 	allowed = (URB_NO_TRANSFER_DMA_MAP | URB_NO_INTERRUPT | URB_DIR_MASK |
-			URB_FREE_BUFFER);
+			URB_FREE_BUFFER | URB_FREE_COHERENT);
 	switch (xfertype) {
 	case USB_ENDPOINT_XFER_BULK:
 	case USB_ENDPOINT_XFER_INT:
-- 
2.30.2

