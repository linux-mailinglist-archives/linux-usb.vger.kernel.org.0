Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A989D257B53
	for <lists+linux-usb@lfdr.de>; Mon, 31 Aug 2020 16:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgHaOb6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 10:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgHaObu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Aug 2020 10:31:50 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF6D9C061573
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 07:31:49 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id i4so2479875ota.2
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 07:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=NlgZekIpL9wNbPEPLwLdy3j6dgQgvggmBGXyt6D+pCo=;
        b=YC+8v2ojr8q5cja2gGezsIlqV2o/tHRZjm3YM4RdnVEHqa1TGd0yCbnpJzLWXWK97f
         nB68Sbi0O2jT+dRJ/xWwoaQ791DiQMPZSItZkXoVuDBkpqyA/7Z+IaIVZ4z0F9PSIztC
         jc1WmLOVoiKyfVH5MR3sx9J+hPlD0YsZoI3A3XjRqpT1qbDrU6dVqfq1Cw8IjjfVmHco
         LTw14UfML1T2EsAJuXLt5z1/B0MwxN6DxpRvXQTp1zEBSKou+nbAChKMCAlgq9p/Ni4i
         u4lCdh/qmd7OG1cCayl0RTANGV7A18nqk4S4Zwi76G3XIHdCRKXcCgWwbQ/PysKQl9tM
         BQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=NlgZekIpL9wNbPEPLwLdy3j6dgQgvggmBGXyt6D+pCo=;
        b=cKdAq1TFWo+yZVJ38tCBV5eozb6q7cBBqq0hRzjXyWlisSmEmrlxy5eGKba4EPNtMK
         YsGmTqDX8Drgk8fOFWZ/z4REOI3eITvHI2cfiyFWmYl4xP9svK2mpWMs1zPsfJxNe2sL
         IKx5CCA1RkmKqSYOw4L+Yge0k3or9M45lz5xpDaakuSB0BaXMm8WutBFF+zPD5Wjnz8P
         uiX9ADbyvwzxsza7/bQcUVDpSNPRAVPm5kYWKeBx4SsQ4ZqTaxLZIWDQnSwdBJiz9SzI
         axGKe05r8/wf9CfYZ4BkDqNUSjTPRYeagjJF8HOZXxbzbAREDdv7Lc6IsqLtaEutH9EY
         6qFQ==
X-Gm-Message-State: AOAM530pzASfgD0D745vT4e4d/vro9oEUUkbO+nANFOcZ5/rDMkYAIhO
        Ua0Jl6dOHy+zYP8Ahw641wW3RCziKcA53fIcD9F5fCN7Hg==
X-Google-Smtp-Source: ABdhPJxDQrWnEkbyxoB4c+HbBhJT9ft9KGopK3rejdWS5vuCrH7BcPp9w3xaB0SkDBo5XMQTlpFBgO1XZyLAcZrZm+4=
X-Received: by 2002:a9d:238a:: with SMTP id t10mr1129515otb.340.1598884306981;
 Mon, 31 Aug 2020 07:31:46 -0700 (PDT)
MIME-Version: 1.0
From:   George McCollister <george.mccollister@gmail.com>
Date:   Mon, 31 Aug 2020 09:31:35 -0500
Message-ID: <CAFSKS=Pv1Ji4XqHjVMCAnszq_HjFYYk7GuzeeCCScHd1NMumDA@mail.gmail.com>
Subject: usbtmc: stb race condition introduced by 4f3c8d6eddc272b386464524235440a418ed2029
To:     linux-usb@vger.kernel.org
Cc:     guido@kiener-muenchen.de, guido.kiener@rohde-schwarz.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since 4f3c8d6eddc272b386464524235440a418ed2029 I'm experiencing this
STB race condition. TL;DR an old, cached STB value can be used after a
new one is reported in reply to a control message. Hacking up the
latest driver code to ignore the cached stb value gets around the
issue.

My USBTMC device has an interrupt endpoint with a 1ms interval.

1) A query is sent to the USBTMC device.

2) An SRQ is reported via the interrupt endpoint with MAV set.

3) Userspace performs a read to get the reply since MAV is set after
being notified by poll().

4) A condition on the USBTMC device triggers an SRQ before the
response is read but is not reported until later due to 1ms poll
interval. MAV is still set in the reported stb.

5) The USBTMC device submits a reply and clears MAV.

6) Userspace receives the reply and does USBTMC488_IOCTL_READ_STB.

[ 2584.683589] 000: usbtmc 1-1.1:1.0: Enter ioctl_read_stb iin_ep_present: 1

7) The SRQ comes in but too late to be used as a cached value by
usbtmc488_ioctl_read_stb() so it is stored for later.
[ 2584.683673] 000: usbtmc 1-1.1:1.0: int status: 0 len 2
[ 2584.683684] 000: usbtmc 1-1.1:1.0: srq received bTag 81 stb 51

8) A control msg is sent and the interrupt endpoint replies with the
STB. MAV is (correctly) not set.
[ 2584.684657] 000: usbtmc 1-1.1:1.0: int status: 0 len 2
[ 2584.687642] 000: usbtmc 1-1.1:1.0: stb:0x41 received 0

9) Userspace sends a query in response to the device condition
reported in the first STB bit.

10) Userspace does USBTMC488_IOCTL_READ_STB before waiting with poll()
and finds MAV is already set (incorrectly) since the cached value from
the last SRQ is used even though the bit was more recently reported
not set in response to a control message.

11) Userspace then attempts to read based on this false MAV 3and finds
no response.


Am I making any incorrect assumptions about how this should work? If
not what could we do to fix this behavior other than not using a
cached stb value? FWIW I'm the author of the userspace code and the
USBTMC device firmware.

Regards,
George McCollister
Software Architect
NovaTech LLC
