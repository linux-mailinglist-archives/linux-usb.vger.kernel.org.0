Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA3510441D
	for <lists+linux-usb@lfdr.de>; Wed, 20 Nov 2019 20:17:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727674AbfKTTRT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Nov 2019 14:17:19 -0500
Received: from mail-pl1-f173.google.com ([209.85.214.173]:42363 "EHLO
        mail-pl1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbfKTTRT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Nov 2019 14:17:19 -0500
Received: by mail-pl1-f173.google.com with SMTP id j12so217494plt.9
        for <linux-usb@vger.kernel.org>; Wed, 20 Nov 2019 11:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gnarbox-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:user-agent;
        bh=PscCw83IIgt8PaIGMnuKIu+49v5Uxw34ntqtiUdpBUs=;
        b=CxsC6YzPs3GR/73C37e/brxHWDtCEoj+CLnOMJoF+FIHICCyRBleN/gdCl+g75JFtS
         u2yXpc14sWs5juko284turex9mfZ2szkl5sZX6nEsxwzcH1kcEvv96itLQxOWFu6Hmeh
         /Hp0nLX3xzv8P/kW5xgMAyZrWW2ONPWmOP+XMvY47j2LLImucBalAGnzWwcPOHpiJ10E
         V+H6ZXPXP3Z0uEBtOkd48zaC+7Zt0GKJIkoZykOtq734UX3yPu0VCCIGxIKf75PD1N9I
         tV/mqOieXH49XjM393sNfOpq3vrvgtpzQ1p9aXk72dM0lqbb9vfkhKe/Glj19piFsAwh
         UWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:user-agent;
        bh=PscCw83IIgt8PaIGMnuKIu+49v5Uxw34ntqtiUdpBUs=;
        b=a7Ccf6fbgliZNPXR1PyxYQgvjyPBrEViIU3bNxp+V8PVmk/51Usk7ABZd4Uhafy4eg
         znl2CR6an9JRX8p74NDNg7TvUpEJgzniI2hNEIs8oxlWBmG8ZInXZYOsLojkVYzxF0kT
         kJZl98kJlmZBLgHrsrHjEznkx0dLXOi13rr65eRIWZQOmSkZ33s+zRyTqWCx7zUz4NCQ
         qYX4MzJ9/8EKe3jMv/FXK9AaLJYY6EV+fA0KBhinx1G9JnB73GMvyDQbN96wlI0nhDeK
         9rDjqwiV2RfD59+OCh4cjdhmzdYKlDby16E1CIW0agfin8ryE8LWsjv7guoNHg3JH+tu
         JJkA==
X-Gm-Message-State: APjAAAX1nL3efOrZ5lVtU6mTE3C/hp3w0k+W7KRnga0sH0LO36EY+6C2
        AC81o5Ky8uxA/q1taistawC2MtKu/qo=
X-Google-Smtp-Source: APXvYqwajebQNCIMldp9ymP4BMDfGE8niqhtYrx+ZgGQEQ2wPYp/CxqyXCkD6goB2GfeN17CCMYfJQ==
X-Received: by 2002:a17:902:9a02:: with SMTP id v2mr4526190plp.221.1574277437726;
        Wed, 20 Nov 2019 11:17:17 -0800 (PST)
Received: from gnarnia.home ([47.180.176.91])
        by smtp.gmail.com with ESMTPSA id p9sm146648pfq.40.2019.11.20.11.17.16
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2019 11:17:17 -0800 (PST)
Date:   Wed, 20 Nov 2019 11:17:16 -0800
From:   evan@gnarbox.com
To:     linux-usb@vger.kernel.org
Subject: DJI CINESSD USB Adapter Failures
Message-ID: <20191120191716.DVZ3qorXy%evan@gnarbox.com>
User-Agent: mail v14.8.16
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We're trying to connect a DJI CINESSD USB adapter to our custom
hardware running kernel 4.9.  It enumerates, communciation fails, then
it disconnects.  This cycle seems to continue indefinitely.  I've supplied
links to the dmesg output[0] and the USB protocol analyzer capture[1] of
this situtation.  Please see the Data Center tool[2] to view the capture.

The device also does not enumerate properly on a desktop and laptop we
have running 4.15.  There is a patch[3] that disables LPM for this device.
After applying that patch the desktop and laptop work.  We already have
LPM disabled wholesale on our board so this patch did not help.

Does anything in the dmesg or capture jump out?  What information can
I gather or next steps would you recommend?

-Evan

[0] https://drive.google.com/open?id=1eDtuSFfCmC7uX0pEdw8L0UPWMPLXzW4B
[1] https://drive.google.com/open?id=1ew160mTiC5joeJPo0wQvagTr8o1tL3kt
[2] https://www.totalphase.com/products/data-center/
[3] https://lore.kernel.org/patchwork/patch/990417/
