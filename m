Return-Path: <linux-usb+bounces-4578-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAE881E6F3
	for <lists+linux-usb@lfdr.de>; Tue, 26 Dec 2023 11:48:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EA191C21E71
	for <lists+linux-usb@lfdr.de>; Tue, 26 Dec 2023 10:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2ED4E1B3;
	Tue, 26 Dec 2023 10:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="UrhTxzCe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6DD4CDED
	for <linux-usb@vger.kernel.org>; Tue, 26 Dec 2023 10:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40d4a222818so14834475e9.0
        for <linux-usb@vger.kernel.org>; Tue, 26 Dec 2023 02:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1703587703; x=1704192503; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Tze7RVqWhslJT9AtdeEG+9Ps0aRnh7cCs+8BStlLR74=;
        b=UrhTxzCe2OesiWZ0MqMhtrseIQLAj0UFM8HFX/YlaAgZBh92Yggq5GhMOhWSbfZMYq
         +6xyrXlxjiIo8pgOlfWuRJejJovwCZmz5cIzzfjhRA1zpQEykNDzoQ8bn/trwGAw6qWd
         Ui0Cpj1v+FPODTa9cEhpwl7C/xuHuwa262fTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703587703; x=1704192503;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tze7RVqWhslJT9AtdeEG+9Ps0aRnh7cCs+8BStlLR74=;
        b=VxpCpRcugQfkh71eyaDJ6/hmV52UbI1EtdNC8suFRD2TGTmBBPGp0gmf9Dravp8/l5
         8wRTWa3YsrHIQfPTPopmk9fj/I7KecXYfhhO8DDx4uv94MtL0EbQnnCPMZZjqMLRunau
         1uzVb+aXdEoYMhT/5dHcpQflHP5ojjv7Jw5rXjoagxLHM0ROxE7pJlHlVTqIuHi7Eipe
         EZdW/fJ2vT+Md8hkPHQD/qdHta+9SKnEadhiEeGy+synjdKIoYBjEor9lHQB6WmBPCWu
         pXOIqceljgS0YUfdX1rO10JyZOzXpZa1Cm26Fqhx21vqxlr6KgS3yOd6zj+oR7h20ws5
         d62A==
X-Gm-Message-State: AOJu0YzF6Yvum9rEeWM3kvijggmMcAytKCDv4R051ipp+5r5PL+kI8oi
	q9Fc1o8W2qeqYQDOoibnnmKiDB4iUlIf+D6Dp2dMHd6ycR00Hw==
X-Google-Smtp-Source: AGHT+IENz28Mb3d2uYd+hiMGTrEXWGRCiGJWNYJEQSdOb0r35ivxFnDKbblFIw5e6MTtPBZP6RnBgR+TQbDcUnCcElM=
X-Received: by 2002:a05:600c:c3:b0:40b:5e4a:2354 with SMTP id
 u3-20020a05600c00c300b0040b5e4a2354mr3353060wmm.86.1703587703035; Tue, 26 Dec
 2023 02:48:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Suniel Mahesh <sunil@amarulasolutions.com>
Date: Tue, 26 Dec 2023 16:18:12 +0530
Message-ID: <CAM+7aWt7hJSmJQ78Fes0jMcrF9E8yhN=sDgYuU-hBxO0+1Uj0g@mail.gmail.com>
Subject: USB PD TYPEC - FUSB302B port controller hard reset issue
To: Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Kyle Tso <kyletso@google.com>, 
	linux-kernel@vger.kernel.org, USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Guenter Roeck / Heikki Krogerus and all,

1.
I am testing USB TYPEC PD on a Rockchip Rk3399 SOC based target which
has a FUSB302B TYPEC port controller.

2.
My source is a wall charger which is based on Gallium Nitride (GaN II)
technology and has four ports as follows:

USB-C1: 100W PD3.0, 5V/3A, 9V/3A, 12V/3A, 15V/3A. 20V/5A. PPS: 3.3V-11V/4A
USB-C2: 100W PD3.0. 5V/3A. 9V/3A. 12V/3A, 15V/3A. 20V/5A PPS:3.3-11V/4A
USB-C3: 20W PD3.0, 5V/3A, 9V/2.22A, 12V/1.67A
USB-A: 18W QC3.0. 5V/3A, 9V/2A, 12V/1.5A

3.
i am using latest linux-next and enabled all the relevant configs, especially:
CONFIG_TYPEC=y
CONFIG_TYPEC_TCPM=y
CONFIG_TYPEC_FUSB302=y

4.
DT node is as follows when i use USB-C1 of wall charger:

 connector {
                        compatible = "usb-c-connector";
                        label = "USB-C";
                        data-role = "dual";
                        power-role = "sink";
                        try-power-role = "sink";
                        op-sink-microwatt = <1000000>;
                        sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
                                    PDO_FIXED(12000, 3000, PDO_FIXED_USB_COMM)>;
                };

Issue:
The board power well most of the time, but may be in 1 out of 5 cold
boots, FUSB302B is getting a hard reset, as
FUSB302B INTERRUPTA register bit I_HARDRST is getting set.

After some digging, found out that the above behaviour is accounted to
when something is wrong with the CRC of
the received packet (SOP - Start of Packet)

This behaviour is seen i.e. FUSB302B getting a hard reset more on the
USB-C3 port.

Any pointers on how to solve this issue.

Thanks and Regards
-- 
Suniel Mahesh
Embedded Linux and Kernel Engineer
Amarula Solutions India

