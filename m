Return-Path: <linux-usb+bounces-19214-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F10FA0A81C
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 10:57:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 820BA16219D
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 09:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D222E186E46;
	Sun, 12 Jan 2025 09:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DN67ii6D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA85A2556E;
	Sun, 12 Jan 2025 09:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736675778; cv=none; b=Jf4KvO2ztLUmT094doPiv49fumPaT+UXmBY0IrcDtLmip7QxYsbfltkaZJVhbBW5sAWiYraUukpf+/uUtmGa9zQ4hRhdXxRl5elH/5LQYSq/rbC+0nSHBUW7HFmuZGBBM0JS0dX71VlpqW5Go7F8RXEU0lPKyMGwEP/XEclh1kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736675778; c=relaxed/simple;
	bh=ytj02AxXoWsJtFhVLiF/eW7efN52tsTu3U400dh/RhY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=So8WBj+PJfjVlzU1YxUgR6JG+CmVPwEsaezKvLDpSdCZkP3O8sp7Xi9UU+6ZEqefx9GB8pdgCP2vozQ3kpKvf0LlEcNEmyL76jTKOQnzNxX60/KN6ZjnNQqAJx6sJZg+3a9MTnKWJc8DeY420Kkiu4TjPN4UPf7MKqFYzcFgJzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DN67ii6D; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso3430174f8f.2;
        Sun, 12 Jan 2025 01:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736675775; x=1737280575; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N9Rnm0CJsLsNv0vh15yi9ygSuZ9+Nt9CmsslAk2dI4Y=;
        b=DN67ii6DjM3sEpVUZoRTK4qv/KCOAGZcDrakTEP6fvFlt8GmzyKRKMpRn7/ytG/++i
         o6oVLUJB7U0inO4RUcciPtWZhqORp/37zhrYiNSlBPC6mcJ7IOySX3k4O4R6g1x4/AUt
         jcre8fiY7XySaCqC0MtV6J+F//qcO4HHePjWBBi+9BRg+d95hiqRhVr4TTLovHaVQNYR
         j4G6DEbQfiFqiZk3w8zFuHz3H7bgDVu99OKx6p/0F2RD1smkL7o6l27KXdXFU/YBz0ZU
         IOBSRkR/JVi5rmoZcio25DvQ1uUwhJzaq5luft35QzwpFTisV7W0W9BGX/OdcWpz6RxL
         t+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736675775; x=1737280575;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N9Rnm0CJsLsNv0vh15yi9ygSuZ9+Nt9CmsslAk2dI4Y=;
        b=R6XKZ+HSeNiEUA9YwViRDDi2XJd0bq/tvlugrfOO9AvE4hFF4aP/vyI/NKhMUMg2Ss
         VdqFB7ycBKHtNYo8KbMb306jRC5/Ssvp1S+9S89U3tcy6c2FlvHh9gL0nCtNYEnvHIX2
         VLmz3jMGNNexdp3DkWi/pMf3jcr40q1J3LHo2UpjDooLtRq9s6OxXuwkUAS3IRpxpZjr
         vfAx+erqH4Qru9d4PPTZwFwuIuGbTEoNLS8qyHoel2FW54XFjZOLrs/hWzfLhguSSkUu
         CagwUFK4gKnr/LcIAy8OC0PmVyhvt3lw0Qgu/9BVf9i/nUcOl82jVHuUVPWEJpR0/Ohm
         yO2A==
X-Forwarded-Encrypted: i=1; AJvYcCXuH9D8rDAlmO7XHviuUm3h3RkqpWbWdpPO/iCooWgUdG/2gOMFOqhQWFeuy9xysOumFbQacu/sEv4tB4g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXnfuTD629HxsmoUEMAZqw+Kk/YLauX3JnZjGaAiNbbd/OvrGb
	pXH1w/ZqydKlsG5rp15obgtA04/NszumrteOgfkmevpR+JcqtEyR
X-Gm-Gg: ASbGnctPy1wsso4jrWqALKoQsxJYh6o/kw/JZEekXckjEmjqDAA4XFpDQ8nIHXlga7N
	SrhBhL1qnkkN0poCIcIL08oSPuh4YENM4zqXUnmZYZ0JqKd9zVcYiMb0/xbchXUqTpvtwNMXkxy
	/JOTgTPvWDCX/9hpDHTXQHpve3MK+x7y8sDEQOdxuJPciHOlgbiEUveF5OjCfxyPA4J/nG9Lwa9
	faYK0eck/FX+POTrPD/hcPcWtOLAFde/YnUnpPRjoL+qplnNEh4SFgAnLI=
X-Google-Smtp-Source: AGHT+IEvVjXpl+tJMjmBCedWQTlAKW7LkNc+KgsP0l0uKFoTnb45XEpL46Fh1/dmXVw61tJX/v8k/g==
X-Received: by 2002:a5d:47c9:0:b0:388:c75d:be97 with SMTP id ffacd0b85a97d-38a872fb90cmr13635896f8f.11.1736675774787;
        Sun, 12 Jan 2025 01:56:14 -0800 (PST)
Received: from qasdev.system ([2a02:c7c:6696:8300:6dc4:51b5:3556:88f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b8116sm9197177f8f.79.2025.01.12.01.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 01:56:14 -0800 (PST)
Date: Sun, 12 Jan 2025 09:55:58 +0000
From: Qasim Ijaz <qasdev00@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: Fix null-ptr-deref in qt2_process_read_urb()
Message-ID: <Z4ORrl4sZBhPiu2p@qasdev.system>
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

-                               if (newport > serial->num_ports) {
+                               if (newport >= serial->num_ports) {
                                        dev_err(&port->dev,
                                                "%s - port change to invalid port: %i\n",
                                                __func__, newport);
-- 
2.39.5

