Return-Path: <linux-usb+bounces-19212-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 021B9A0A5C6
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jan 2025 21:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F39D73A3A78
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jan 2025 20:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1121B85CB;
	Sat, 11 Jan 2025 20:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cOmFDntc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C8817C68;
	Sat, 11 Jan 2025 20:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736626157; cv=none; b=jXLoE7Y+VEQilW2F+li3vcRfuUVFup3Hw5G6X5/xhMDZWImhgvFVAM8ttBMq2p8mNyG150C/NyF9lIsCN2rQY1dsmb+G/5w6ouZgZHGUOyBBj8HDiUKs6PoGG7rrDu9RFtGahKJJ9166SoiXM5+ar3nqzO5539E5XnJvq786idE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736626157; c=relaxed/simple;
	bh=ulQ0vpACgRJnm6O1Q9Y6F7irckY33aVn5G++FNwQmg0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NCW5d+/yShdcH8T6hEQe4eqr8y8sxrJ3+mNwwEyPa7q9nml4OaLV30mGoLx7lJtmQUn0m3H5Efd2fpMWEt7w/J/HkLNZ770Q/JUXGNx26NGiHxz2kCSfbHiUH2g3dEWRln6Y3zwW3egeNHMLLcyTkOk24VSTMtoZTrtA14VW7tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cOmFDntc; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43675b1155bso35631415e9.2;
        Sat, 11 Jan 2025 12:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736626154; x=1737230954; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/1V1Gr47SLXD7h4Qx7pGEm9MFBBRsQqFOq79aNqbb0A=;
        b=cOmFDntcbDQD3vfUwWrDJhiYoDuzuyaVNPTYx8lUCn2pUT8UOiwBdgQrKtKKOMufLe
         5Kd7epkA/WwSljPv5kZT4y+v8LE7MBBNy7QjZzbaO1HQVDiCHQ/1tIpyYDPEXO5x1jNE
         Jq9Q74C8FtyGZHrgc9VUu8TvrrYEAn5vHhv/VOWSRFeaL+1II5WI5hZ6xIRyqBTlcRIP
         zy0UBIdFlABxkE4gopG27cei6Um82Ww7Vh3zKO6n0Tqqa+LzPf/7zVi27hIet6tTpOJ2
         hYHj2YucKUgE0RzQuCTw0nVDdi98doysp06kRflPx7RJEhEzzuaLeR97kyZXJ0e/hOHV
         F1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736626154; x=1737230954;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/1V1Gr47SLXD7h4Qx7pGEm9MFBBRsQqFOq79aNqbb0A=;
        b=NFWfx6xIHQm1Xcy4oSHtiuxI8UGJ1SZbfr57EnAB0Gl3q0ntE4DiTIkm6eWTFCz9Zc
         9LjFgVxlQ8rFoJABPJcfho6nXD2Pu5MRZ+eWe32AyoXgIec/fTUTb9oRWt+ZsuY4radA
         dKEE6oLUCJvGxOyAHk1ufadeTZZfayEx2YU6YpOWpA4mdYsuxPp3mIFxOwtkEN2vLDet
         kxL1UfHY9IlpGiF+GDAS0sYd3H9YCBIeAOyZBShbja4pey7dNytctcl0C/83Vn8ar65T
         OcZsHrcxKP2MqsIbaS4aYtCd9D22g5oi8n3VKN7/XllwU5RTsCKpk8c125xRqgT9tcO0
         VVWw==
X-Forwarded-Encrypted: i=1; AJvYcCXgkvSHGknxwit8KYG/jDbPiCZUmeR1lSSATqQRS+aJE6qTdF+Oy0j1iPhOWfbihJnxx5mrb/iuuv/8/ns=@vger.kernel.org
X-Gm-Message-State: AOJu0YwomzosJXhEI2nght/tIhMH0GwaYqTIG5lUdr1vOJY8ub/sL8uV
	/qnlI28LX5V0BmTj52gNnD8NL8KhZeCcfy22xlnqQObixKXXEvPW1vHQ1g==
X-Gm-Gg: ASbGnctASJgxgao+qGBMSji6OnRMRogPmuqKbpowTUqU8NTDhWyHCMRCwhMyQGHvAhQ
	Kc4QbXq4Jk/gMsxPJY9mJO/bY9oGokL6K5ygu41btqynPHOuZQDEYvL+NZGAKEYaA/wcHXI44kQ
	h6GXE3wd1Rud3OWi/DkwC1X6ZBDXkXVbrrICrG1zSHSmarNuiqmrIBYQGHczXtqubZxzcn7NzoC
	hCAk/4lOMIpPxHLF99S8tKAnH5aOakNhu4Whwlx/9vwdhvg/5hqp8cRAzTX
X-Google-Smtp-Source: AGHT+IGtiiXXu0hIIHdCAUUQ6EONlMwpxpPv+d62+7r24SNAjfl6kSZS0/0ATQdufEwEUChIYExc7g==
X-Received: by 2002:a05:600c:1ca5:b0:436:1971:2a4 with SMTP id 5b1f17b1804b1-436e26c3efamr151505815e9.17.1736626153394;
        Sat, 11 Jan 2025 12:09:13 -0800 (PST)
Received: from qasdev.system ([2a02:c7c:6696:8300:9f39:d006:679c:adf0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9dd1de9sm91550345e9.15.2025.01.11.12.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 12:09:13 -0800 (PST)
Date: Sat, 11 Jan 2025 20:08:49 +0000
From: qasdev <qasdev00@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: Fix null-ptr-deref in qt2_process_read_urb()
Message-ID: <Z4LP0VsyOkaRBQL9@qasdev.system>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch addresses a null-ptr-deref in qt2_process_read_urb() due to
an incorrect bounds check in the following:

""
       if (newport > serial->num_ports) {
	       dev_err(&port->dev,
		       "%s - port change to invalid port: %i\n",
		       __func__, newport);
	       break;
       }
""

The condition doesn't account for the valid range of the serial->port
buffer, which is from 0 to serial->num_ports - 1. When newport is equal
to serial->num_ports, the assignment of "port" in the
following code is out-of-bounds and NULL:

""
       serial_priv->current_port = newport;
       port = serial->port[serial_priv->current_port];

""

The fix checks if newport is greater than or equal to serial->num_ports
indicating it is out-of-bounds.

Reported-by: syzbot <syzbot+506479ebf12fe435d01a@syzkaller.appspotmail.com>
Closes: https://syzkaller.appspot.com/bug?extid=506479ebf12fe435d01a
Tested-by: syzbot <syzbot+506479ebf12fe435d01a@syzkaller.appspotmail.com>
Tested-by: Qasim Ijaz <qasdev00@gmail.com>
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/usb/serial/quatech2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/quatech2.c b/drivers/usb/serial/quatech2.c
index a317bdbd00ad..72fe83a6c978 100644
--- a/drivers/usb/serial/quatech2.c
+++ b/drivers/usb/serial/quatech2.c
@@ -503,7 +503,7 @@ static void qt2_process_read_urb(struct urb *urb)
 
 				newport = *(ch + 3);
 
-				if (newport > serial->num_ports) {
+				if (newport >= serial->num_ports) {
 					dev_err(&port->dev,
 						"%s - port change to invalid port: %i\n",
 						__func__, newport);
-- 
2.39.5


