Return-Path: <linux-usb+bounces-23075-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADC6A89AF3
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 12:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 744363A9DB3
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 10:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D238927A925;
	Tue, 15 Apr 2025 10:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RzX+R7ZH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F27292911
	for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 10:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713915; cv=none; b=M+LAj4mK4jI1YxwpEAiHpqNrUV66esFzdIF3/6IAjWAEHVRNCzkoAsmRwenvljTqL9D4jwa8d8T9nvVRi+LV92Ib8YnwRn8Gx3Qm5yVF5vzuQ733Q0SS/jPzYmlQKGRsRWb24VXSGxo8iWbYi3gyik2vzgXmVU4EEZrtC1FhJVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713915; c=relaxed/simple;
	bh=fWybr2mbKY7qGwtYIZOqWE7CzXG4hHWRB38TSR3OKy0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ddcbPxwfdfwx3juXm79Y1syngtXa2aSwrr0o3J2td0I4NSY8/cBONs4qX5NksG9U9b3qWuX9TiuqrB+t5PDbZSUqgecJrDhFZykyswoZaDAPL5Gz9imU4qLbiUEJOTC4+NoaSVFHmmoAJILkglNqseBRISSg8nEw1xprpJsYO0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RzX+R7ZH; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso3220125f8f.0
        for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 03:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744713912; x=1745318712; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MK0WNbcSw4ed5M+cuZDVZvCtmU0gyT+OlvAi63oIbak=;
        b=RzX+R7ZHzDIYeuFFMHRllgaRq1lcrTbfv50CSffTmnYLsS6pIdaY/xpgeHbiWFWIPJ
         P/HnI4vbZkMsWL6KW6wm645WzX5BJZt0ytSwAUH0x3jIg/M7hoJ4pyr/dbnuGKBZj04x
         TS21bbDEPt/2Vn6tNURf7cfgimX7aZi11yeyjckmRxBSa0IVuWT1NE9/65LQXk3AEor4
         ZAv0Ok7Mfk2kAysc+EVxcHk7yvpqSCI/Teci0M/3Ofs6xlouUTX0J8bpP4CT3GDa7PQ0
         JV7tbBcOn7nF7DHv8UH9l1oyQXUqJKwWiOeA6s7oge6XMfU381VeHLqBXqkO3LSbEgjD
         3PiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713912; x=1745318712;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MK0WNbcSw4ed5M+cuZDVZvCtmU0gyT+OlvAi63oIbak=;
        b=KqpQjYAg80icO7rec0SuYxPa+lOBeXASR5XLiuj03suhp8SksflymXBpmQViP3lvKq
         hCwLAD9OxWkbH5Qb50dmPxMAPsNSvIMES0YLRrBy2Loh/LsKb9Ti4BM+o6dCn8aIaTzr
         4tE+YTzFlmk9kWNeSVy+Gtg/O7Dxy4LLIyjNAZiqAea4IWlES3FekobIL/wwkBWS3YeF
         iwkORxYKFc/DgpNcUl3RbUL9qgLZFI1lSrr6mIjwHo65u2rymXqFJz5Zvn7LjO2HLs/7
         Z5DpA9GpNdORhrmjVmR4sKkTufKHiqIifupBQ6nGvLpzbBkj+GSg7UvHv8B2AaSYzQCQ
         CbcQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9nMZcP3IdCcoTeYXXoPiFWMYalts9NRwBrgmyDsWSREyMfk1BmhqS02Wm1Uhd7srstBzU+LiPe6o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJiNxBkkSFbJn1hZvfRbMnjuqqWkB/TIcOriKlq2VvFXc+pC4V
	cUPxKctRm5rPVqnRWO5JpV8OFx0e4IKrcRQGN/9xQamY5TlfqqtRUIt3p2795Sw=
X-Gm-Gg: ASbGncurg4QwNDY6MEUYLaTfdFclpProB5XoUg+K4DaiqgYsK5Ut4kaVwq2qEj7Ukhu
	hh+GCLUduI/pDDwS8RRRIEGCoMIBJ5V7rJepyZdpSdONjfCNFcenZa2xis9dYmYeeIWbmy3kCa4
	JXVY+AH2gK/r8e+aEM+pebh0zsYbvRBoFg5ItAD4udTBLjw3innxAmPzNOKsLyDwnOP1S4BvwtV
	NqTmHqGhgUi9Yg8GlBot2fqtF7iSBafwBXKq49GKMCEW9Pm+chs/8pimNdoD5NneKMlmFZqdRKc
	OkPveoVB+V6pQjK0/2B78oEWIRTlNkgM/jCsGz06v2Qcsg==
X-Google-Smtp-Source: AGHT+IEIyKYv0BMZJodwyHmcwoGOgDdIqbSLHON2cJ+W/AbXoA9xLZFAvBmJ/hOGIRmJfI19cAlXiw==
X-Received: by 2002:a05:6000:240c:b0:391:4674:b10f with SMTP id ffacd0b85a97d-39eaaebee70mr12627884f8f.36.1744713911750;
        Tue, 15 Apr 2025 03:45:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae964025sm13625378f8f.6.2025.04.15.03.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:45:11 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:45:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] usb: typec: class: Unlocked on error in
 typec_register_partner()
Message-ID: <Z_44tOtmml89wQcM@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We recently added some locking to this function but this error path
was accidentally missed.  Unlock before returning.

Fixes: ec27386de23a ("usb: typec: class: Fix NULL pointer access")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/typec/class.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 3df3e3736916..67a533e35150 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1056,6 +1056,7 @@ struct typec_partner *typec_register_partner(struct typec_port *port,
 	ret = device_register(&partner->dev);
 	if (ret) {
 		dev_err(&port->dev, "failed to register partner (%d)\n", ret);
+		mutex_unlock(&port->partner_link_lock);
 		put_device(&partner->dev);
 		return ERR_PTR(ret);
 	}
-- 
2.47.2


