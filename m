Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0C5F18C525
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2020 03:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727240AbgCTCDH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Mar 2020 22:03:07 -0400
Received: from mail-lj1-f182.google.com ([209.85.208.182]:45685 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgCTCDH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Mar 2020 22:03:07 -0400
Received: by mail-lj1-f182.google.com with SMTP id y17so4739680ljk.12
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2020 19:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=E0gwhMDbSCYM+6fvzu0q0kjDKlMwTH2orjtJKwoQ8yo=;
        b=Qh4u6Tl8bEIKURtc3HFJSUuhbg7GyJSzHlUAV/SjgEhcV/GS6AGhOSFf3tgCHENubn
         0BZ0cOP+6HvivqNOO1j2CPaPuFlSblIYWRVcuTfTcLU0xuOFWzjQc1G6013QAfWeLfUC
         Y+zviPv3lucCpVBw9tR4ze/wAvhU2q0w1SuwQ8Xhtf8dfQniG+xJ8P6qgMxEnLWJhtxY
         FA+oTOkuygyWplhV+ntptmtOkKoLxN4pfUc48RHmV22yv13iB93t3cguZtFSPxOyuTIq
         M7PRg3p7XuxJun6sCDg3CbQiiJ3M3VTMakB8eOKcFISPJiYDnJWOI7OP/s01bjoiSZ3Z
         ySsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=E0gwhMDbSCYM+6fvzu0q0kjDKlMwTH2orjtJKwoQ8yo=;
        b=acI8ImtuGBgEsVkpxKDOg2WyhCKO3W3SeoUtxhawWDctCw+sHmNDJDjjojmShrSvY2
         RB20AGnxWv+y82S+sPTrj//6DqgxhDBOTiU4yxz6gH3dAxCBZKZIWjeqz5vtOPR2GN86
         tEdVdQYosSCV8a1e+Df/SBzCHeV5A3VfojgNZW7g+3YhJjNvnnOqko835rLs1Oap9E6H
         HGIxMCgqG8WXBWy4JgWktv5qsBWraQxfnokEWBrjDso/VP7QB2bBF7qdKTdpNAfcNH32
         O99etJxv8SoWmM7mUlS+BhmpUtQDSpS/CFhpA/prIWYnihef9Bav+iQ68VOrtmXfEACt
         l32g==
X-Gm-Message-State: ANhLgQ36E5pSdfi+LPl4k8n+d5X0i1rDioc7V/uAt0+GWjNOf9oXanG1
        bOqdJfpwWqx4LmezexqvH9c=
X-Google-Smtp-Source: ADFU+vsKyKEYH425nXQjGFyr29pcvSEXo3G4GZaqksramMxPlMti1niGExBQx4JQXWbDjeopkeyxHQ==
X-Received: by 2002:a2e:964f:: with SMTP id z15mr3921230ljh.237.1584669785420;
        Thu, 19 Mar 2020 19:03:05 -0700 (PDT)
Received: from siyah2 ([88.241.68.50])
        by smtp.gmail.com with ESMTPSA id y184sm2454893lfc.97.2020.03.19.19.03.04
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 19 Mar 2020 19:03:04 -0700 (PDT)
Date:   Fri, 20 Mar 2020 05:03:03 +0300
From:   Gokce Kuler <gokcekuler@gmail.com>
To:     outreachy-kernel@googlegroups.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: [PATCH 0/2] Avoid multiple line dereference
Message-ID: <cover.1584668081.git.gokcekuler@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

merge a line -> with a line ending with a sign

merge a line -> with a line ending with a sign

Gokce Kuler (2):
  staging: rtl8712: Avoid multiple line dereference
  staging: rtl8712: Avoid multiple line dereference

 drivers/staging/rtl8712/rtl871x_mlme.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

-- 
2.7.4

