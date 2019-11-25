Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09881108DEA
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2019 13:32:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727506AbfKYMcQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Nov 2019 07:32:16 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37118 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbfKYMcQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Nov 2019 07:32:16 -0500
Received: by mail-wm1-f67.google.com with SMTP id f129so14374299wmf.2;
        Mon, 25 Nov 2019 04:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qj+4bU4iAR1bmxTb3zIVAu22SiEhIJXMWgCyj+oySrk=;
        b=bG+O1I6ZmrQNsFOgEVTrnemdxU1u0tbnl6p3Wmb+zDbF4e6+wZHnNpxVDR1JQ+yMuZ
         tuDFlxl36aB2KPuaJ0rzPMxrSpONOseJMyJFU427F2e0xcImY46QlO8jgDIN2f0Kic1n
         A3U507+7QBOCyxVlY2xQKYNYHtaOMsr+6xGpgMvm+OKFtmoW6HYgrW84+RHLmxul1i9O
         3GYvYKodhj9Mr8ZOJ9PItK7OIKVxOXG3dAf3i56dyJdqGTlC7qffy+nRwdrhehOkLJOk
         rYMjmnorbE58+3QR3BlNO51ew2AIfG1Rw6v9RY2EqVQKlHxrlFqKzdaW9oxN3q1oTZHm
         K6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qj+4bU4iAR1bmxTb3zIVAu22SiEhIJXMWgCyj+oySrk=;
        b=cc99n1cSl7Kp7hBdV6lHEz5Q7DIgciYmG/CWb+RZsJi1gl+muqyOgdT1G71V4Y15A3
         esTaVkVNrR3t8xzcT4BcP3qSESKhhVEAeAUcGdmUgtvposkvsBdnW5EbTEyyH/RPcHDn
         y7sxmOwqWNy/9D1s9wlAIzWnuQabf7JvIQOBVjAw0qwVndTbJ8hkz+xfBZB0+EzkmvuV
         J51KKgQcHoChmbIrPB7gg4fKosD3Dv8ZRu+Fko3oh32R8C8PWk9bURK42bGbeFw5Ig90
         w3MxhtdrB2/AIDrJGGpRC7IafYQwbe+hfO9VzOhwtvRGeOa0MNB0IKDQ/Fimjp5bQ8fs
         pD2g==
X-Gm-Message-State: APjAAAXgjPCXPOiqGFjnQzvT478+61pYcJqVflTqwIg3KjDbGtDk0mBB
        455xnKAmYjNDXM0jIwyRqKtCqvZf6hQ=
X-Google-Smtp-Source: APXvYqzrUzxJZErxZfu2H0+5K/hQDvtBt79MFac0+2+o4XeDMsPGFppq0/E8OAGJ0xZvtbf0C3/Vnw==
X-Received: by 2002:a1c:cc1a:: with SMTP id h26mr18055015wmb.40.1574685132290;
        Mon, 25 Nov 2019 04:32:12 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id z15sm8137563wmi.12.2019.11.25.04.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 04:32:11 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 00/10] usb: host: xhci-tegra: Implement basic ELPG support
Date:   Mon, 25 Nov 2019 13:32:00 +0100
Message-Id: <20191125123210.1564323-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

this series of patches is an attempt to split up JC's large patch adding
ELPG support into more manageable chunks. The original patch can be
found here:

	http://patchwork.ozlabs.org/patch/1115804/

That patch was part of a larger series that also added a couple more
features to more aggressively save power. This series is more limited in
scope and at the same time tries to address most of the comments that
were voiced during review of JC's original posting.

Note that this series is primarily targetted at getting system suspend
and resume to work properly on Jetson TX2 and later, now that we can
actually resume from system sleep on these systems. The code should also
work on Tegra210 and earlier, though Tegra210 is still missing a bit of
the very low-level plumbing to make the system resume properly from
sleep.

I've verified that after this I can successfully use the XHCI on Jetson
TX2 after a system suspend/resume cycle.

Note that I've claimed ownership of these patches because they differ
from JC's patches significantly in many areas and are also a bit
crippled compared to JC's original in terms of features. I've credited
JC in the commit message, but didn't want him to get any blame from me
potentially messing this up.

JC, if you think this is still in line with what you had in mind, let me
know and I'll restore your authorship.

Thierry

Thierry Reding (10):
  usb: host: xhci-tegra: Fix "tega" -> "tegra" typo
  usb: host: xhci-tegra: Separate firmware request and load
  usb: host: xhci-tegra: Avoid a fixed duration sleep
  usb: host: xhci-tegra: Use CNR as firmware ready indicator
  usb: host: xhci-tegra: Extract firmware enable helper
  usb: host: xhci-tegra: Reuse stored register base address
  usb: host: xhci-tegra: Enable runtime PM as late as possible
  usb: host: xhci-tegra: Add support for XUSB context save/restore
  usb: host: xhci-tegra: Add XUSB controller context
  usb: host: xhci-tegra: Implement basic ELPG support

 drivers/usb/host/xhci-tegra.c | 453 +++++++++++++++++++++++++++++-----
 1 file changed, 394 insertions(+), 59 deletions(-)

-- 
2.23.0

