Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE07118C528
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2020 03:04:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727257AbgCTCEU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Mar 2020 22:04:20 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33202 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgCTCET (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Mar 2020 22:04:19 -0400
Received: by mail-lf1-f65.google.com with SMTP id c20so3317097lfb.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2020 19:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QU4RN4EtkuJKZhC4tTxbQi7GTpKwNRktYK0ZiyOfs7U=;
        b=K2BRwCnzwJh5p/UZaRKctv0Cbh13bOYtrrCUE7fhlqs0II4ZpMF7b4AhC4bitInNTD
         6jjsGuhkQ9HY8lc1Z5PIDvBvpjO6j2tf6TLy0sKK8KOVQL96Xr4gSDwNOmGS0Fe0m8aJ
         lN7m1t4iEOTHGsI5Dv/o3i5SZgM9IVdB3FLb95aA4pdW0UPppiPBdeVW9MjLTGTmRI2F
         HlbjYhLu4vc9hO2oN608KkpCKOxX9MdfDiBD0jKy1Kgce+bgPl1yEDCyV5haxcByluzG
         1y60r5X59pki/dVHRI0/jAMKkGYZeDW8Wzl3LmljV/GGoI2VHZVC8hd8Ydzr63q9kGU0
         e7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QU4RN4EtkuJKZhC4tTxbQi7GTpKwNRktYK0ZiyOfs7U=;
        b=Tyw1Cp3Nlhr8zcGXKx/ATRFpYbcfWoZb5ZcvAY3m1f9vgwjg4T6YZbWM7hSNjxpJI8
         FpfuelJL1diwfvwCy9lMY7b8D2N595qPTsdhLmAp/phS1q/0Y5l/O+5rEiGYNmtQKbsl
         ijUTvKdckEDasaKbvTeMXngRSKl6D1HyLRs0IDwAriEmcU12f20/6R3Ym3VTUP/GdbB9
         7lZ8SImhf0ZfbrjsLHEIolRroqcYLuXs1OYXizweSoiGG4Pb/bwKS2n8lR8a7UmyG0Sf
         P03b078ApW2emve/yX9IeoLeFmvgb+Pnee8ieCLFH7IazVZOepFj4Uqly4GpN8VbU7Sn
         14aA==
X-Gm-Message-State: ANhLgQ31CbE6ygpRbtsIGr+k+URSfNxQytb7KO53of80rgjy3yfjSm5p
        ayhQtcnbUi6fKbmL9CdAF+g=
X-Google-Smtp-Source: ADFU+vtL3DqPSOqEWyV8Tei619R+OqrOdd+DUh50coL+hoT68b9IwHCRVuOz2nir9aUxylfta/9B2g==
X-Received: by 2002:a19:c206:: with SMTP id l6mr2943454lfc.118.1584669855850;
        Thu, 19 Mar 2020 19:04:15 -0700 (PDT)
Received: from siyah2 ([88.241.68.50])
        by smtp.gmail.com with ESMTPSA id d12sm2403163lfi.86.2020.03.19.19.04.13
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 19 Mar 2020 19:04:15 -0700 (PDT)
Date:   Fri, 20 Mar 2020 05:03:58 +0300
From:   Gokce Kuler <gokcekuler@gmail.com>
To:     outreachy-kernel@googlegroups.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: [PATCH 2/2] staging: rtl8712: Avoid multiple line dereference
Message-ID: <5227586f7d1d91ee6f19b1ad8e69b1eefac32f0b.1584668081.git.gokcekuler@gmail.com>
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
index 74dac74..7d5a50a 100644
--- a/drivers/staging/rtl8712/rtl871x_mlme.c
+++ b/drivers/staging/rtl8712/rtl871x_mlme.c
@@ -1094,8 +1094,7 @@ int r8712_select_and_join_from_scan(struct mlme_priv *pmlmepriv)
 			src_ssid = pmlmepriv->assoc_bssid;
 			if (!memcmp(dst_ssid, src_ssid, ETH_ALEN)) {
 				if (check_fwstate(pmlmepriv, _FW_LINKED)) {
-					if (is_same_network(&pmlmepriv->
-					    cur_network.network,
+					if (is_same_network(&pmlmepriv->cur_network.network,
 					    &pnetwork->network)) {
 						_clr_fwstate_(pmlmepriv,
 							_FW_UNDER_LINKING);
-- 
2.7.4

