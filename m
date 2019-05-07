Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6EF161B2
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2019 12:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbfEGKJo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 May 2019 06:09:44 -0400
Received: from zimbra2.kalray.eu ([92.103.151.219]:51042 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbfEGKJn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 May 2019 06:09:43 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id A6DA127E6E1F;
        Tue,  7 May 2019 12:09:42 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Lg4JUKya0-Yk; Tue,  7 May 2019 12:09:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 6C25227E6E30;
        Tue,  7 May 2019 12:09:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 6C25227E6E30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1557223782;
        bh=lJkb0SVae5ImfVJl4o3bDB5PM1QHCDMnpKve3ZN+smc=;
        h=From:To:Date:Message-Id:MIME-Version;
        b=KP0I+2bI44u3ap4cjHQRvPN2+h7DNlqi7SaBt5Ch3p1//kwOEFVMjnTU/o4GF0zJq
         gqsopGQa7m9krOm9Nby1gFrGXn2FCIuqYXJTgKF4eqMNlNHN9XZwnrq4VY7eC+b26Q
         L7QhPvjoa7XCPRx2KefY4gFWAEY5wAWpcI6yCRMo=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 0mEtyzqwr4mo; Tue,  7 May 2019 12:09:42 +0200 (CEST)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id 4B82927E6E1F;
        Tue,  7 May 2019 12:09:42 +0200 (CEST)
From:   Jules Maselbas <jmaselbas@kalray.eu>
To:     Minas Harutyunyan <hminas@synopsys.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Markus Reichl <m.reichl@fivetechno.de>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH] usb: dwc2: Use generic PHY width in params setup
Date:   Tue,  7 May 2019 12:08:51 +0200
Message-Id: <20190507100852.11263-1-jmaselbas@kalray.eu>
X-Mailer: git-send-email 2.21.0.196.g041f5ea
In-Reply-To: <20190503204958.GA12532@kozik-lap>
References: <20190503204958.GA12532@kozik-lap>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

The patch 'usb: dwc2: gadget: Replace phyif with phy_utmi_width'
changed a little the "behavior" of the platform lowlevel hw init.

As setting the params.utmi_phy_width at that time is pointless,
see the attached patch for detailed information.

I think that's why the USB on Exynos4412 fails, and why adding
the width information in s3c6400_params fixes this issue.

However I don't have the hardware to test if this patch resolve
the issue on Exynos4412, any tester would more than welcome.

Cheers

--
Jules


