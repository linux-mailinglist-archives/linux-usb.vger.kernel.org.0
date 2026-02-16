Return-Path: <linux-usb+bounces-33387-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FJZKpMok2kI2AEAu9opvQ
	(envelope-from <linux-usb+bounces-33387-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Feb 2026 15:24:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 494EA144949
	for <lists+linux-usb@lfdr.de>; Mon, 16 Feb 2026 15:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BA8A30541FD
	for <lists+linux-usb@lfdr.de>; Mon, 16 Feb 2026 14:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA31311C27;
	Mon, 16 Feb 2026 14:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z3qIIcWz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD8431196F
	for <linux-usb@vger.kernel.org>; Mon, 16 Feb 2026 14:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771251720; cv=none; b=g3sxb8Jv16SHFPRU2+04q9tl/WkjqAv/wgaWxG+zBTRdxU4hN9nUCcRPxrNTNM6ZUGREOAY+X0dDvtKJ17h7h1RMyRcdSgeI9+Fgesxmezd7R+DWNXMk06B0A/AzWfRa3cWv8T5fgBlwVeiOV/qqkj31YW5g3iYWL4djgnAM52M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771251720; c=relaxed/simple;
	bh=swRvlvPe5R/LjcGwpOyqg3vGK98nZUkf0KBb5iWx1pI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MyzrJIr9FObgcDNaxBkBO2kqTTpTDP7V2QUiz1pW+gOhjkXuhsOsgmuBRjaPuk7Eutgs5WDeGRocP88XYX/8BX+6EYNnxfawvhKVR8byCBGzaAYcCWlQrwzxYD2RKlT5omyhmdns1LDGft8pLsFqPTG3qaMowIZFP7tkZITX04o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z3qIIcWz; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43767807cf3so2399287f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Feb 2026 06:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771251716; x=1771856516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZG5d4AeEhK6Ekl6x66KHq/6RRjwI9BsPgGa3qMbbWPQ=;
        b=Z3qIIcWzxmE4w8S9n4xv/bxv9dSOYzAhNlqZ5kLfwVobaoTJT8itGtKk+Xaxu30iFH
         TL00mlV+/L98FK7k07YD0CyaLHSK61MH9MAbDa1oUvFaowkM2InC/VLYaCB/ElevvyMX
         Z8A+pjTKEi6AVYI8vSdqlpf24HubiH+nqBwvCXo/xiAkA10KPTpUDUMypUXItrnvt9Z1
         c6TW3kdlQLsk+cxfrqBttBWQCS/O+LY1W5mwC2+EcV/RQrErvH4osXBS9YOiIWN7PVEt
         KBhsB1QP+WevJpVhzj+ITKtDz9/2YIVIOY7VmEPPhf7xipWwmQhk76qibEUIIvj/LVD6
         rcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771251716; x=1771856516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZG5d4AeEhK6Ekl6x66KHq/6RRjwI9BsPgGa3qMbbWPQ=;
        b=Ow1VACQZXeD+49GHHJ6MKvaLSFdcDUeyTg/+fNZXIJntHuYE0rRubqm7XKb1oD3Lo3
         SHkyAWu4j8VNztmEgHYp49+BrYW40vK13yjnaD6Q5uC6wRsl6rS47r8h3AQFuCNj+Mnc
         g0bdA9BPulvzgMIedn0B0UdEaEnnSrUSDCSglKfj5LcImTV8/M8X2mt2ZRmpUwrKAPRN
         Iaese61Kw1IhXhCyJDdF7zEWY4npcSUw5xc1oWRKgsv3YHhlEIpklKIYOuxKFWQ2o3Ax
         1PDzk1/5xtmGx2y6zmn8k/FOfgXuqvt7Xl1V6Tq4guBTFcWRUmeLLIMBD+SM0p2Ob/v8
         AzVw==
X-Gm-Message-State: AOJu0YyrR4VcdpsYgzkSxca2Kys16u3uiK0ZBS0HYvy2H6VUVFKargHC
	lWl6QMDMlgpJh2xmXC30SwzSu6yNitfKtt4pewVGA0aF79q3V9gAk++bFTCBu2ulUng=
X-Gm-Gg: AZuq6aJ7wfvuHRMOaYqNtX2o6opQSYbiDKq5+8bmvBs08a/qv08fcRqsEa++UwvkSB9
	8apnyVu+GKB0JIsBzVi//6rZDdchEhdka66OAUB7oPfnVSs676bCobdsZ6Ns1+vb4vSfKbiRIXM
	7wBMAxr8tc4cQYMpyjCVEmMcSA2RxOK0t3Lbu87Wy9W2XW9zHoa0DZXBfLMbxfGGwdzvY2WqlTx
	oI69A1V8qQXAmKEYvQkdbo6R96YU/gflj1qQhyg/8f3sVkdjjLqGkYg/mWNWBz1li8cqCRLjaOy
	4FN3leOLtqICl2z8T6r9SNos2bdoG/pKWWL0IDT5+8CctI/T/0ifY7ItcQAlebunGgE0rGIicrS
	sKC3CCO8Bd54UnsnvTEmYJ2ZZX2HNIDaVOqTxDnuvcHxmiH3ChAGHqADCiKXYlmETnBMNFRzqZG
	5G8PhRn69VJz0SxI0lvA3hulk2vjyym0L/2n37ikL+NqPk
X-Received: by 2002:a05:600c:a08e:b0:483:129e:b573 with SMTP id 5b1f17b1804b1-4838dbb7237mr17621375e9.18.1771251716237;
        Mon, 16 Feb 2026 06:21:56 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370a63afesm86717475e9.9.2026.02.16.06.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 06:21:55 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 16 Feb 2026 15:21:48 +0100
Subject: [PATCH v4 4/9] pci: pwrctrl: generic: support for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-4-802c82795431@linaro.org>
References: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org>
In-Reply-To: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=782;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=swRvlvPe5R/LjcGwpOyqg3vGK98nZUkf0KBb5iWx1pI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpkyf86/3oKmTNhtXBfUIVltuEb7HAf6vq+eH2WHPn
 MaSqsSmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaZMn/AAKCRB33NvayMhJ0aIuEA
 CHBlURac/cOv5Cakz3+K/ib4WO7qrQxbVbVopkK5TDOIA1TWK3JF8aWU88IDXBRdqP0xJH65xItdCC
 mefkwdSlYiT1pcSLIJPnyPqyknEPwUzscGv2LOLIa+StI+Etp15Z5L4+AtDDzRf11oTbR+YwyPIuZi
 Y3IW8KcdrgnzyPe3s/kyF1dkBoAxT6kDKNddnQ1Iebs7zHuAe8xjPNkznhFPu3arsUHRDtUSCuyDd1
 Cl8FGHTGU1/EfG0v8vpf0m60EPMQN2MBnogK1wiaoCG+7JHC3ZB//B1lxVBorXKhpa7DnPNf87C3YX
 YnH6si64RgSlVrk2jOCbx3w2QbbWP7CJyXFrSsS8ORqz0i60OfG/ZuMSQOsbYQGUeWRexLuLrSBaEh
 Jy3YjKxFuHRW/TUfXtX0xEMmOlc+js2eX/wzpbM4eRQtAIm6wzgMak59hLll6Tjd8aPtDFn/o/DqIN
 +XNdxx4gAlFv5hzo7F2nGv0xr/M33gzSPS0w8yNV9kyEo6vqNF8rKEPUZT2sltxsFXyCq3wXqyJ0j0
 bia2Aktfwjzc5YWJum/tiufCob9VS3NlHePyY+CPweLIk07GNtF/JoKm+vQHR7tiog3IFAWiUX5dLx
 pmTjNP28AgLTCQ8OyH8g8dtkvHSQ/QQleeYEsYonvUP1Qzhf8y3lIcT80E4g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33387-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 494EA144949
X-Rspamd-Action: no action

Enable the generic pwrctrl driver to control the power of the
PCIe UPD720201/UPD720202 USB 3.0 xHCI Host Controller.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pci/pwrctrl/generic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/pwrctrl/generic.c b/drivers/pci/pwrctrl/generic.c
index a5b7b7965f46..1afda639f0c4 100644
--- a/drivers/pci/pwrctrl/generic.c
+++ b/drivers/pci/pwrctrl/generic.c
@@ -73,6 +73,10 @@ static const struct of_device_id pci_pwrctrl_generic_of_match[] = {
 	{
 		.compatible = "pciclass,0604",
 	},
+	/* Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller */
+	{
+		.compatible = "pci1912,0014",
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pci_pwrctrl_generic_of_match);

-- 
2.34.1


