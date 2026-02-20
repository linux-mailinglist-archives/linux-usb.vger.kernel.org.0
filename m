Return-Path: <linux-usb+bounces-33521-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMNkIpJ4mGlrJAMAu9opvQ
	(envelope-from <linux-usb+bounces-33521-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 16:06:58 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0EA168B4E
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 16:06:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 596593061532
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 15:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4873502A2;
	Fri, 20 Feb 2026 15:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hNPgyRpj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CB834EF02
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 15:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771599896; cv=none; b=ZyunwQGc37o2/gmTCg2qxaYm3AhZbnr7LFk4c0bzr1kT64gWJPj8CEqnRF7WnjnnnwcHE4emnvYDI1jtxbCyVclSxS2pFz1wutlE4K5Blafy63vB21fLjcgedXntlWW2nQ/QLzzZIk6B6INePuSJO5E2xT7pT49GVzM5ephEpWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771599896; c=relaxed/simple;
	bh=xJCGSZr6hNfy2o1VTKZssAjAq6hV+BsznAwWlIlxuGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WvwcnpxJtD5B23mJOyPzB/Yj5mpUd27u+F7eBIoN4MmuxkWtzuNdhvEcPLjJom00/IkIQq/u6DYD8QphshtbHDnZjEuqqrEehe8pRcon9ehlUEfdWOUkwceJta19qos2meOQzFMecwJGN0NJwqBvOOamlV6OFp9kR8vdF081/zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hNPgyRpj; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso16392345e9.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 07:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771599892; x=1772204692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3M7D3/IWCY77zVq+OSkyrB/ybXLf5mjVJRVSBa3XrmE=;
        b=hNPgyRpj3+05Jw1n95GFcBjxBIEgz5bKcV+McsaCqUhG6lLrNwhQer8d8VoBwgvcwM
         Bapff6+EVOuAnl6iHpYfhHOQsNrYwgWty5Z6jB99pg0p0k4kpAc92qLTp4pbOsFcwR5g
         UHBcUYCtOGzVtKxGFuRWs0WgnQfJHup9erLug1K9CieWjIWGgt+UveLZOYy7/er0f7wf
         SI+wnMawD6ts/nvnj+rK04QX4LV6r71FZAN50yQbD7Dlp6PegeI93W3ePh6Bb2KyMkKv
         4ucR+njYN16wY6vqD32EyXz4cNWI1+80rnQ85PngHm7WACVl9SjxLpBGH8fv2mOI9LlC
         W9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771599892; x=1772204692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3M7D3/IWCY77zVq+OSkyrB/ybXLf5mjVJRVSBa3XrmE=;
        b=FOdc+k0Dglf8kZAKQrhgWKiyuKVtjw15S5iowOBBckFhxiTU0WCNvCBk80XBzFQKRt
         2SfnHk0ZLfwb8T+k/hqn4yD+317xRbZ91FtCIytzHMCsOjUbjVljjM/6opnA7SUuGOY6
         21G9tPO2PCW5/tlmjs+hLcC8IDe//4pnjmjmXC5c8xawUX0RxwaGAlMFF5cz2J1q1jUg
         sPCkyXXKpaFRufp85RunRPIy6NaRnqTPcm3kL50pSeX68fRPEUTRhpT5lyk+hDzj9VsD
         cmQje85t7lgAuLofts4tbhAzmQ7SSZVJr2s3saa8RktLuZ5YoIF/Fwv1fKGLkP6QOMJR
         8d1A==
X-Gm-Message-State: AOJu0YwN5SEDAX66U+VIw9W91sYR5ljzQUG5jaJt7uCBzom0l4N2PLZU
	BUjUDpE1U6g0Isw8zOCgRxrH08kaQLHSuCpR24kPf7CTaR1gW9tFkhn54XZFm53FOGY=
X-Gm-Gg: AZuq6aK5ytPrW0QTfsmjjFj61R/6pZjU1I7XMtBlk2UfMIs2tM6hoegMMYKFNViswKu
	i/3ZEnF0Aat5vrnLT7QUMm0ErH3kd27gQE47/VhSGukfxTaQXeZp4CM+BgoF3wLNkCY895wA/9q
	xHz7Qm5M6+I/M3Cfry8oB6zSuGvdG4oGxuoSusjLeUvDk/rFm5u2URrTqcECHPrIs5EpzevMWil
	G/R5fi0jzLYm2s1bgpfTsQs4c9lXWMbul/+y9Wren1nKQHdrJZDq8uEPXIB589pPnyZhm6TIbsz
	LAVDimQIJ+o7Hc/4SrZEyOjTMuxKHUtEpv0LnSpefVKkp6slOanZWI02OhVYza2gbJoMiWtjoEU
	s+FgqdqGJ6n3fzsrFg1iDApchQt5FBXr8IOgfVkBGWZw++MQU41HHxt86/F+mzkdXSepeA7Kg6E
	PsOtjkNkmzKy3vTRMaByG2oUsJh1u6Zie82mWX5HDHyfz7
X-Received: by 2002:a05:600c:871b:b0:483:7783:5382 with SMTP id 5b1f17b1804b1-48398ae5e18mr152435765e9.27.1771599892357;
        Fri, 20 Feb 2026 07:04:52 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c56d8sm122064505e9.8.2026.02.20.07.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 07:04:51 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 20 Feb 2026 16:04:43 +0100
Subject: [PATCH v5 4/9] pci: pwrctrl: generic: support for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-4-1ad79caa1efa@linaro.org>
References: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-0-1ad79caa1efa@linaro.org>
In-Reply-To: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-0-1ad79caa1efa@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=903;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xJCGSZr6hNfy2o1VTKZssAjAq6hV+BsznAwWlIlxuGI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpmHgMmJnNP2UaHm8nHYbJM/bBXMFDCVDHeA692oFT
 nHGCmBmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaZh4DAAKCRB33NvayMhJ0VqkD/
 46dy1L1HpkaVrmje7dWcxQPqjm++pN0TNk3nqAaJgv+Qv4GlwOnO/WYO5OCkCnitKFEs41reRqrDXN
 bbVaH0N8Ar+c6mSijlW8JV8QgFVWZ5vmZ2gY4Nxv3rIBjzupIvFaMKEEKNJxJ8eY3ZsRUQ466JqGEw
 v5xu3n5oL0XcFMZExX5AYr8dcvtJ3irg/T7qaaS6g301pBP+IAJHsy7UqHvUMD6lxt3VeLtcajsBvc
 aPX89coqrNyOuRnhNl+TJPb6v9/WEWniQpwfvkva3X6bMCVWkB6ea6XwbhDe6Og/KBRPL5aLRb5skj
 PfEP0G34YOVW9oMPUwy9UbHZD/SXW5Nk2gZ7bUio1rlaxePrMv9E+y6YgiGfXhPdwShmxkdjqnEMOw
 eSGaoKc64NUjNkJ/+sHP0kk7xyPfh+iNlTZQ35FZE6Nv1QX/6JVaUifAnJ/cLBqJp6XyiNK50Ri4pn
 6ymuewV0659YD0y+JZ8qp+8TtdETAWe8mKqeDJ+6/tgqeEE2RmNJ2CJCOmPzNKju0gcCh6aKXoz1tZ
 8sFF8+DFQPFvZbhfsOF/85IEWp1RIHlPMV/BCAYALdWOR3X28BDbqKdI/CgKb8GG2/DqHwCDcZluJg
 RsRDt1BbsHlxJ8qUicbTD8JBVspS4V2oaXywk73WAQTkThbCVX1sxOqhViMA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33521-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 3F0EA168B4E
X-Rspamd-Action: no action

Enable the generic pwrctrl driver to control the power of the
PCIe UPD720201/UPD720202 USB 3.0 xHCI Host Controller.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pci/pwrctrl/generic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/pwrctrl/generic.c b/drivers/pci/pwrctrl/generic.c
index 8e6f2fd5bcaf..a48896118d5e 100644
--- a/drivers/pci/pwrctrl/generic.c
+++ b/drivers/pci/pwrctrl/generic.c
@@ -121,6 +121,10 @@ static const struct of_device_id generic_pwrctrl_of_match[] = {
 	{
 		.compatible = "pciclass,0604",
 	},
+	/* Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller */
+	{
+		.compatible = "pci1912,0014",
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, generic_pwrctrl_of_match);

-- 
2.34.1


