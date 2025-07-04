Return-Path: <linux-usb+bounces-25463-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D69C8AF8526
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jul 2025 03:20:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 819F6565004
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jul 2025 01:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC40F143748;
	Fri,  4 Jul 2025 01:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X9M8fNAR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B5913632B
	for <linux-usb@vger.kernel.org>; Fri,  4 Jul 2025 01:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751592024; cv=none; b=lYBFk+RCzgvV6GysGHOjn4ilFSBpRPG3NzPY9EZRCVtgDgAmUGIlGWPW8M8DhlO1hzlSzHedOZpQAGU2wyrtE1B72L0XFVSk3udgd6xjqjYtkXgwkBvL4l8HghJhEdJK4HN34cFg0ykgjKsA4Gd/en579iK9FuU8OyOGLDy2ECY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751592024; c=relaxed/simple;
	bh=HdPNF5tvzZHy/U0HDtfqdXSgMT7sjPnEhZmbbJSwPeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rLnKDQtgzRCXm2ZRUbzxrLDVZFB64Xf+W/rKjSj3F9sGPxKOoZxqvlWIErOV1SvoJpPRDtp4AMI5XlT0DAjrIuHlCaDs7nN3cSy3wsOlW9eQEpoqOfcwnRRm2sktgNCZ14LZ6rSnyYyzNGHcJG+sxQrpn/iIJbmam+S9Eucqh2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X9M8fNAR; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4079f80ff0fso1116410b6e.1
        for <linux-usb@vger.kernel.org>; Thu, 03 Jul 2025 18:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751592022; x=1752196822; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eVDOdTwjs+UuXyvtB1sz+zfsO9z7jQfbxWc72oZjmuY=;
        b=X9M8fNARfbX+l9vKuw33eRuJGo9YuMzprCWWDnz8MbxiQ29+SMkyQW32juajQl6Eim
         SKp+qnAxPmMhuN08wlQ88/Cg2y16k5qVPWMpfxag8feSQ0dn8D4y02xgxlOA0sufCI/F
         NigYwlsegYjHvZ+BGL3MsKhfm7BNbDy86bxh7NWc7ghPHSM6McCFqLhLyyKTXh/W2ABs
         IIlHg2UmoA8JTXqtRe7EmM2r3TtD+QnfVgZIXH8fmASZjvYqF3Zg79zmxRPf3VITOhRm
         ZUgn2/CGLV46sJqE/Mc9f3lPPUesZrefx7d4WKZRjGrT2Oe50kssgemUuGvJhpjji+YF
         c2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751592022; x=1752196822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVDOdTwjs+UuXyvtB1sz+zfsO9z7jQfbxWc72oZjmuY=;
        b=UbIbE9bleK6j6e7kjmzJWBWxjPRaCHkcUZShz7f3yo7lzFFno53U9ZnM8OEk4BsxVd
         k7d5KwLTdmASGnspELUJbDUNJcIEL8FUjrJP3rfFUF5EO1duPCG8uuX2JhhidZ2BIiT7
         JkeQUngZn+RhMkDJgVfwXETSikXIh4Ya7IzAl0a2RnssUsRp2bpZUR1BIJilr0WXj/y4
         zLZaHizwFysYczEBweqjViy6zOUPsnXqRpKXBAngnGdTTX6jJOH7aBB6DLeMopyCKLEg
         jZ3Fw17Z18rJxAxWOWePNKZ25Ll3U/H/tOSzxt4xxIo0XB5QeR0i11bAxDL9FQuzEwmT
         wAuQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2OyBkcTZYCQXUSuEf+SD7ZUHP1ISDEZJuBQw56G2Yo80B22HWxfu7myrIP2MPrmUp7u1P5nKDUkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEkZGvDsPiFYLO10Hqad6wGZSjmzxuQuC9IvpniFGtKb56up/Y
	z2BgjzZ0gzeYLZss+fqeIlsWcKDP7+I9Xz9nNJj4JAP4ml8/xUDeCGlgL+9UDKMa6RY=
X-Gm-Gg: ASbGncvib1F/8QzYUdfYuKrPlhg5D7Epi38s9WwBAcoAmyM0L2bSZ3vbLsVmPBIi2vq
	uoiVX/A5zv6/IfqNAFdnjEs0HPvX0OJUpRK33fK6nmIn25kU7S6XpRXfIZOokHirWDfwrZTWPXm
	LS8UMi0+jO06ajQDRIQMsyzgSr/spqxm4PGJbsLHwAIYOtndOtCNBNJHCPuDlDVWFLM03izbpKi
	qkhkqmodE8NNP8Ny+gt7JAdDWmGrVKTeVm+sFgGX8PtgKvUkZv2HwzOYObVua/Q37j/U85wm/12
	rucjeigZkNAqJ4Yx2p6aHIT1XVduMqwLTUJWzpdXct/uvnAxbo8v/Wy3L6izWXhOdejMzw==
X-Google-Smtp-Source: AGHT+IGL22h42DOm/O6EysFpyLDhHXHpPkLnW4IjU4MzOnIssrqexxfruWiHq2QQ0znXzzhun3GQ/Q==
X-Received: by 2002:a05:6808:1b22:b0:40c:fda3:2f0 with SMTP id 5614622812f47-40d029f5278mr1098385b6e.6.1751592021667;
        Thu, 03 Jul 2025 18:20:21 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1ed4:f8f7:2a8d:77d5])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-40d02a33d47sm149020b6e.10.2025.07.03.18.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 18:20:20 -0700 (PDT)
Date: Thu, 3 Jul 2025 20:20:18 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	s32@nxp.com, linaro-s32@linaro.org,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH v3 1/4] dt-bindings: usb: Add compatible strings for
 s32g2/s32g3
Message-ID: <596d188a-9a2d-41e5-af70-c99bc2b7ca7a@sabinyo.mountain>
References: <cover.1751591078.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751591078.git.dan.carpenter@linaro.org>

From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>

Add the compatible strings for the NXP s32g2 and s32g3.  These chips
are mostly compatible.  The one difference is that the s32g2-usbmisc
device has an errata ERR050474 which requires a special flag to be set
for handling packages that aren't 4 byte aligned.

Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v3: Remove some CCs.
    Fix the ci-hdrc-usb2.yaml file

 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 5 +++++
 Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml  | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index cc5787a8cfa3..691d6cf02c27 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -23,6 +23,7 @@ properties:
           - nvidia,tegra30-udc
           - nvidia,tegra114-udc
           - nvidia,tegra124-udc
+          - nxp,s32g2-usb
           - qcom,ci-hdrc
       - items:
           - enum:
@@ -37,6 +38,10 @@ properties:
           - enum:
               - nuvoton,npcm845-udc
           - const: nuvoton,npcm750-udc
+      - items:
+          - enum:
+              - nxp,s32g3-usb
+          - const: nxp,s32g2-usb
 
   clocks:
     minItems: 1
diff --git a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
index 019435540df0..ca677d1a8274 100644
--- a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
+++ b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
@@ -21,6 +21,8 @@ properties:
           - fsl,imx53-usbmisc
           - fsl,imx6q-usbmisc
           - fsl,vf610-usbmisc
+          - nxp,s32g2-usbmisc
+          - nxp,s32g3-usbmisc
       - items:
           - enum:
               - fsl,imx6ul-usbmisc
-- 
2.47.2


