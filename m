Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1E7718C526
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2020 03:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbgCTCDn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Mar 2020 22:03:43 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46022 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgCTCDn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Mar 2020 22:03:43 -0400
Received: by mail-lj1-f195.google.com with SMTP id y17so4740903ljk.12
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2020 19:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=I69HdjzAo7WYzqHf5ZKcwQo4vs8GT14NEPwhfoW8ieY=;
        b=JfP94Z8r8qWfN/QuLFIHOvwspWc/wB5lQH1eNHGyux7jmyE8rOAYvA9ZS5vT+aCgUa
         KL79QU55f4JtL9p6lHJYNVK9kDzd3JyZIHvt0Edclnd32FLOsCQvCZXUtBq2JXLTSN0i
         DMqhIVcbgHL09yl3+A3HSug4UT+9IphqDpahPbfdUY6WNdowWqdYT5aRMD9AJa6x60v0
         OcezRLB0lbOuF6/2SY1JMzBeAPaAzDJY6OgLllHimsN3mqQqJafW4vNLNqQvcHrYKq9F
         iCQXNNpVxzk61V2Hd1jlyd+CIv37Nw+grO86NyryUZkc7JoRS68hzsOBjxMc+a0CK8fM
         +UnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=I69HdjzAo7WYzqHf5ZKcwQo4vs8GT14NEPwhfoW8ieY=;
        b=EmyI1jrwaFvgg8ipV8cW7Lk7wguWejZ8KasfO44NhAm6DvOgDIH8PTR1GamPjGp8uA
         bNPybK6UXBjwa8eTx9uDGUTSWu0jFEvAbXaM2ejb5nPxOihQpRMJlsLGqwgOUqmi2Y4x
         GJ938u1cKBkZa0K/iK8rUjIbSIBn/d7ltxfz8uAbX+bkuW27Oz1KmYwqgOToITtPPQ9J
         aB8QNZ8ObMgCtx5Hhzr5nkzWcUls7Xh5CNNptKf2XVFJI+d75wXKRyy4htKt1dmu1/Fj
         dS1fk9XSl92DyEmixOH5mngPMUWQP8B1d74sqPsYXw5IWXpF7sStNVCdRDkXy5eVbrhJ
         19xw==
X-Gm-Message-State: ANhLgQ3y6XmUjtRauaWbZDi0NxMBcVSGug3+3mJ/nOHx7zRL+CPgaAQZ
        /6HK7LO+d4WMTdFONuyinCU=
X-Google-Smtp-Source: ADFU+vuTw5ZEVsVnAEHrmn/VL8svDTxhaToINivnKVhvBIJGQJL+nkYi/V2ljBYGojA4r0WPuMwwog==
X-Received: by 2002:a2e:330e:: with SMTP id d14mr3899357ljc.72.1584669821859;
        Thu, 19 Mar 2020 19:03:41 -0700 (PDT)
Received: from siyah2 ([88.241.68.50])
        by smtp.gmail.com with ESMTPSA id l17sm2867519lje.81.2020.03.19.19.03.39
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 19 Mar 2020 19:03:41 -0700 (PDT)
Date:   Fri, 20 Mar 2020 05:03:30 +0300
From:   Gokce Kuler <gokcekuler@gmail.com>
To:     outreachy-kernel@googlegroups.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: [PATCH 1/2] staging: rtl8712: Avoid multiple line dereference
Message-ID: <340c8671b671ed9b1416cfc7790e0e4426f89371.1584668081.git.gokcekuler@gmail.com>
References: <cover.1584668081.git.gokcekuler@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1584668081.git.gokcekuler@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

merge a line -> with a line ending with a sign

Signed-off-by: Gokce Kuler <gokcekuler@gmail.com>
---
 drivers/staging/rtl8712/rtl871x_mlme.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_mlme.c b/drivers/staging/rtl8712/rtl871x_mlme.c
index cabdb35..74dac74 100644
--- a/drivers/staging/rtl8712/rtl871x_mlme.c
+++ b/drivers/staging/rtl8712/rtl871x_mlme.c
@@ -944,8 +944,7 @@ void r8712_stadel_event_callback(struct _adapter *adapter, u8 *pbuf)
 			pdev_network = &(adapter->registrypriv.dev_network);
 			pibss = adapter->registrypriv.dev_network.MacAddress;
 			memcpy(pdev_network, &tgt_network->network,
-				r8712_get_wlan_bssid_ex_sz(&tgt_network->
-							network));
+				r8712_get_wlan_bssid_ex_sz(&tgt_network->network));
 			memcpy(&pdev_network->Ssid,
 				&pmlmepriv->assoc_ssid,
 				sizeof(struct ndis_802_11_ssid));
-- 
2.7.4

