Return-Path: <linux-usb+bounces-4879-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2097A827F1B
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jan 2024 08:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC280285724
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jan 2024 07:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D098944B;
	Tue,  9 Jan 2024 07:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="PWaO4h2c"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F7CB645
	for <linux-usb@vger.kernel.org>; Tue,  9 Jan 2024 07:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3376ead25e1so1184067f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 08 Jan 2024 23:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1704784652; x=1705389452; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OchCzgotCx6qu/9IkiIF6+O+Abm7bmipg7+KM9sddOI=;
        b=PWaO4h2clCKmLZcFQ84viF2erY7E5fuSrdMKm71JiC468s1nyICUmM8+8gqIUj0w8c
         /aHYZXKkd44nqBhNPgArTwN8Yaw5Cw+RAgg/MymRSEPoeckzgrYcfZLFqUiS7rhzbapD
         jAhS49CaxNyS3nQXHw0qMt6wfDLsBXY0ub3pM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704784652; x=1705389452;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OchCzgotCx6qu/9IkiIF6+O+Abm7bmipg7+KM9sddOI=;
        b=kIDXG5XYf0/hh/aWTcpwW/J8r5Zz5IsZ7/s7m2eoRJnbN0LXE9PJiNg+JMZ7TOgpjE
         R9kb/49y6I/O01hH4Q6C+ViqC309bYnu/+4UnkTJ07FeyIQO7P9GaS70qGcLVw+CBmxF
         xMuDdBn1K4fVF7UW5u/+C/KngQ1P0VriXiBxjl74dkNFnRwZMSwK+FqRXk4e2L/JvW7R
         b8Ljq2DzG7Ebr6MF9fd8HgADbAo7Y/NqLDOSh0RKof5mf//4dO0EYDQMfmDUyqu1eb95
         s6+DcH0j3Dnp3PPDNfPuN8GnASRnhMd0DQNY6eSCLjSCDH4DA28xSCb9Vo/OfAsZ+YVh
         QXsg==
X-Gm-Message-State: AOJu0Yyk8e11ox6BscI9cES9eF9ug38MMnsa0T35vWyHdMDiSEOqcGTi
	+crcoGnJTAsDgNdWiwqZ9nRStQgUNq07fImhVvXWjxBkOHhJKg==
X-Google-Smtp-Source: AGHT+IE8g9H1xQnaEw0sn8epxL0e49UcqAH+tFlt8yuyw/dkODyKiSOO6910tZBmJlRzQhRtmzKCqG5PUdwHSFmA4W4=
X-Received: by 2002:adf:e5d1:0:b0:336:ca94:3e00 with SMTP id
 a17-20020adfe5d1000000b00336ca943e00mr262001wrn.69.1704784652096; Mon, 08 Jan
 2024 23:17:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Suniel Mahesh <sunil@amarulasolutions.com>
Date: Tue, 9 Jan 2024 12:47:21 +0530
Message-ID: <CAM+7aWvmmyyLN5YHuJhg_X402OFmP_sVe6h_mr5tURjv0Ti5vQ@mail.gmail.com>
Subject: USB PD TYPEC - FUSB302B port controller hard reset issue
To: Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	USB list <linux-usb@vger.kernel.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Da Xue <da.xue@libretech.co>, 
	Da Xue <da@lessconfused.com>, Da Xue <da@libre.computer>, Kyle Tso <kyletso@google.com>, 
	RD Babiera <rdbabiera@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Guenter/Heikki/Greg and all,

This email is a narrowed version of the earlier discussion at:
https://lore.kernel.org/all/CAM+7aWt7hJSmJQ78Fes0jMcrF9E8yhN=sDgYuU-hBxO0+1Uj0g@mail.gmail.com/T/

Please guide/suggest on why the FUSB302B port controller on a target board
is getting reset(hard reset) on reception of a 0x0 packet from source(PD Wall
charger 100W - 20V@5A).

log when reset:

[    1.599049] FUSB302: IRQ: 0x80, a: 0x00, b: 0x00, status0: 0x83
[    1.602836] FUSB302: IRQ: 0x00, a: 0x40, b: 0x00, status0: 0x83
[    1.606210] TCPM: tcpm_pd_event_handler: in TCPM_CC_EVENT
[    1.968179] FUSB302: IRQ: 0x80, a: 0x00, b: 0x00, status0: 0x83
[    2.133140] FUSB302: IRQ: 0x41, a: 0x04, b: 0x00, status0: 0x93
[    2.133704] FUSB302: IRQ: PD tx success
[    2.136046] FUSB302: PD message header: 161
[    2.136392] FUSB302: PD message len: 0
[    2.136845] TCPM: PD TX complete, status: 0
[    2.139382] FUSB302: IRQ: 0x51, a: 0x00, b: 0x00, status0: 0x93
[    2.142192] FUSB302: IRQ: 0x51, a: 0x00, b: 0x01, status0: 0x93
[    2.142804] FUSB302: IRQ: PD sent good CRC
[    2.145274] FUSB302: PD message header: 1a3
[    2.145674] FUSB302: PD message len: 0
[    2.146072] FUSB302: fusb302_pd_read_message: to tcpm_pd_receive
[    2.146478] TCPM: PD RX, header: 0x1a3 [1]
[    2.147042] TCPM: tcpm_pd_ctrl_request: type:0x3
[    2.147435] TCPM: tcpm_pd_ctrl_request: case PD_CTRL_ACCEPT
[    2.146309] TCPM: tcpm_pd_ctrl_request: case SOFT_RESET_SEND
[    2.148266] TCPM: tcpm_pd_rx_handler: done
[    2.158196] FUSB302: IRQ: 0x51, a: 0x00, b: 0x01, status0: 0x93
[    2.158600] FUSB302: IRQ: PD sent good CRC
[    2.161283] FUSB302: PD message header: 0
[    2.161710] FUSB302: PD message len: 0
[    2.162092] FUSB302: fusb302_pd_read_message: to tcpm_pd_receive
[    2.162608] TCPM: PD RX, header: 0x0 [1]
[    2.163181] TCPM: tcpm_pd_rx_handler: done
[    2.179843] FUSB302: IRQ: 0x41, a: 0x01, b: 0x00, status0: 0x83
[    2.180314] FUSB302: IRQ: PD received hardreset: interrupta: 1
[    2.181125] FUSB302: fusb302_pd_reset:
[    2.182597] TCPM: tcpm_pd_event_handler:
[    2.182937] TCPM: tcpm_pd_event_handler: TCPM_RESET_EVENT
[    2.183292] TCPM: _tcpm_pd_hard_reset: Received hard reset
[    2.183770] TCPM: _tcpm_pd_hard_reset:

Let me know if you need anymore details.

Thanks and Regards
-- 
Suniel Mahesh
Embedded Linux and Kernel Engineer
Amarula Solutions India

