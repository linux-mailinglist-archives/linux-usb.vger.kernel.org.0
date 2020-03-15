Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEFA6185951
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2020 03:45:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbgCOCpQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 14 Mar 2020 22:45:16 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42465 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbgCOCpQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 14 Mar 2020 22:45:16 -0400
Received: by mail-pf1-f194.google.com with SMTP id x2so7368935pfn.9;
        Sat, 14 Mar 2020 19:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kw9CcsIa8hpWF0Iym4ERSAJHoa1aTSGceWaGbJPt1dg=;
        b=LxgvyT3aff88z7LHJUJDOWcq912ZPj1aQv8KmU107rAHX4yAiSlhD4ZaDqqXLhUZym
         3yw+Q7t7hjs2U1Z71QjoSe2n/DklQyIuF9PHsBuNxuegRPfm6TNBNxfau+wQQWXf8oh2
         LXlZcp59nwpAn0RJa/svAbE5LidToRHtefLyMm/fkljfo4aliGv3AGnO5ZP9D3C7Howb
         H0EodKaQILMzDGIsHuqjwKndwEXXU//ObySYiBjtK2bXH8uUheKa3TRI4uaLHBH50mry
         kuhiqTxlR5hqO2fPawbm/eX4Ca9/C3GqTyBgltOYMpgKtTN5c7FCbvFRQKEGX8iyVHmo
         d9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kw9CcsIa8hpWF0Iym4ERSAJHoa1aTSGceWaGbJPt1dg=;
        b=rYtfE8x9cAeGvbr2WK2g+ix9GZoZ+eW+uQpk6eaemvLZImwd/OZ5XRjy/L12sy6CSB
         M37EXFszXdM9FpLZFA8X/Vx+Gs/ZZGBc/N+culQ06w8j/pyYe6ogM+pcWkXJXFwIMvnh
         ZJhGO6Is9j/iJwH07DlriG8xPtNhwD0aNDofja/BbpdqM98Dq4Uc5IzwvOeH6wVsoyOH
         wxykeZOBHg+5/1NhwUoQLMX8m7oOKavFZRH1pR9vrZacB+BV6jE1cziKCmdI3crc8xDO
         KKepJAf0s1VNqveT/tZUjDY85H8zsyixyXePI2ks2SlXOCryUfQKibaM03J1Ujf6/HKW
         jkSA==
X-Gm-Message-State: ANhLgQ3hJw47+uvlA/u20FdkhBDTjMJ0KPerShOcNLlReIf0YPMRE8a/
        qxsMPaE1/uCza1qGmbDsh8rEK50d
X-Google-Smtp-Source: ADFU+vtbdu3hTfKaDghBmaSo6RN03mCYTEzC4zprNx40x5ZF/aUl3sps+Xvccng2BK15502sRo+Cwg==
X-Received: by 2002:a17:902:14b:: with SMTP id 69mr16880977plb.121.1584163607312;
        Fri, 13 Mar 2020 22:26:47 -0700 (PDT)
Received: from localhost ([216.24.188.11])
        by smtp.gmail.com with ESMTPSA id l67sm7248719pjb.23.2020.03.13.22.26.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 22:26:46 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     gregkh@linuxfoundation.org, rafael@kernel.org, hminas@synopsys.com,
        mathias.nyman@intel.com, bgolaszewski@baylibre.com, arnd@arndb.de,
        geert@linux-m68k.org, mchehab+samsung@kernel.org,
        treding@nvidia.com, tglx@linutronix.de, suzuki.poulose@arm.com,
        hdegoede@redhat.com, linux-usb@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v2 0/4] drivers: new helper for ioremapping memory resources
Date:   Sat, 14 Mar 2020 13:26:34 +0800
Message-Id: <20200314052638.6008-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since commit "drivers: provide devm_platform_ioremap_resource()",
It was wrap platform_get_resource() and devm_ioremap_resource() as
single helper devm_platform_ioremap_resource(). but now, many drivers
still used platform_get_resource() and devm_ioremap_resource()
together in the kernel tree. The reason can not be replaced is they
still need use the resource variables obtained by platform_get_resource().
so provide this helper.

The first patch in this series adds a wrapper for these two calls and
the other uses it in a driver.

Since V1:
	- add some real users of this function (Thanks for greg k-h's reminder)

Dejin Zheng (4):
  drivers: provide devm_platform_ioremap_and_get_resource()
  usb: host: xhci-plat: convert to
    devm_platform_ioremap_and_get_resource
  usb: host: hisilicon: convert to
    devm_platform_ioremap_and_get_resource
  usb: dwc2: convert to devm_platform_ioremap_and_get_resource

 drivers/base/platform.c         | 18 ++++++++++++++++++
 drivers/usb/dwc2/platform.c     |  3 +--
 drivers/usb/host/xhci-histb.c   |  3 +--
 drivers/usb/host/xhci-plat.c    |  3 +--
 include/linux/platform_device.h |  3 +++
 5 files changed, 24 insertions(+), 6 deletions(-)

-- 
2.25.0

