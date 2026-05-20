Return-Path: <linux-usb+bounces-37755-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBi3GumCDWrUyQUAu9opvQ
	(envelope-from <linux-usb+bounces-37755-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 11:46:17 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A4858B05A
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 11:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E610304C7D6
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 09:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8DA3CAE93;
	Wed, 20 May 2026 09:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T+YV0UwH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WLcp36Da"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F8D3C9EEE
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 09:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779269955; cv=none; b=Lr/WNnBuSGJUQDl0dWSDTmTzO+tU/x1svnyt+6VeV0MHzbBkOHQhJexh4yz2ABEqAupNinkMZGYyGhZlcKtZXbErHzlC1gX7rAamNhpdRmiH0xmshiGQGVxt2wgQFDRT+4vLzqH1SGVWizR1rM9aJlMker0IYV4A6F6RkW1r+7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779269955; c=relaxed/simple;
	bh=1ROATfcFnGfXhhsL0vtkdzZWxKejY13e1mc5l/KMd/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zvu12c6+dVLsPtvMsbnka87+XhGqLczfvjE/fv2GFre8HkmhECbvfF5rWQunTtfwiAsCdxlyroJ4dWOWlMXkFX0nO62+zvysnUukhui7jppw0Ci/luvB1TSpHAvqqRSIDtIjmUCZhPUVakzOUze2OWF19uOK1b3SLG1sd7s71ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T+YV0UwH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLcp36Da; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7CUdb2065134
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 09:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=I53qzRPF4Onl70g6cIzN+NmpkesSx0F6VI3
	lb4bNpyI=; b=T+YV0UwHvsJoEkGr3AJpgncHysLAS4mC4GpJrz72retPH225pcq
	G7vDmRwN/T67MZumvkR0aoRGvydBaQ5YojOWHTwvVxWUvlja6m0/hu7T13Y1mTRY
	oijcT8ozS7mNRGPu1HplHRPJnwfouus0rh6T7K3itC2l06vPbeinIBpi5yyl804U
	fpCevBPLOneNPb+dHXdEwnmsLIAMuulSEF2TuwfFvHjDtwYQmi89u1DDTcxKeHuv
	2KDua6YeHv9Jqq0J8l4bci4vhFHf05iTviBhixgBgAV5I+n2BcwadHxGJIGQAPWI
	ebI5WlaZwlB+5DqK+wAjZTDffPgET6ZW3fg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t4166-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 09:39:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba6fe41283so47151565ad.1
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 02:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779269949; x=1779874749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I53qzRPF4Onl70g6cIzN+NmpkesSx0F6VI3lb4bNpyI=;
        b=WLcp36DabVpjvAEIRjz0iMTE9jOmic6LLh8dg6acY8K1L585pFoE/RutL9wXgOUX6M
         0earm7Yd+NhJ8SrGS+eb+BMKnVajFiKoJXXhRpRI/rCVghGx2jpl7lLJtRqDOPql6BAz
         XD+BGUG3dWiDSONXhcyls+qIJJ7YX3Ph0b/B5f5Y+2I9LtG0EUG3CaAaWWvp6xDn8rkb
         ni+wnHaLKVMxLZc8b/TU66LkNwpNinYUrqIbiGLThV/a11KLSIZHjB81jsAlF/g0V3vB
         taiSUMdEmGE/smVGLtwKFRg1ejGQ258Gbnsg2Sk3YIRXpn/S0z9SCaU38dbWZdcOQvjr
         NaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779269949; x=1779874749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I53qzRPF4Onl70g6cIzN+NmpkesSx0F6VI3lb4bNpyI=;
        b=jPOhSZLZJKBucT3kk7jJrVjHWnXX5xYXwWSpTphlmKQvQnQkUcGMm1doddPU9Ehb1u
         7ay96f7j9S2ZMvXdtMMQmU0NwRls1HWTPb4UzR2cIFuQEikeBsx0lDXnidf1+BHv6Tz5
         ZJ7s5MVGWuhh9DvuHynWsIFDoWNRC0UVE2/HhcGWwY7HsSF8YofXKsetyctRkJ9FzFZn
         yEZQTwme9tJiE8lpGCbVCiiTN6QiNIdUL2AVeJksGxw2mCpwLwsL2/JiyIOArIJo9Jw1
         tGKCt0aHpr7raG7DVwS/pbRI4sB9kJjG1UXc2paU7t/FlL6+dTQXt0vcgruruDV6tcJJ
         OJXQ==
X-Gm-Message-State: AOJu0Yx5rZAob2i2sh4JuZr4nF7FB6w/WnzbC3XPPN3XF5ezkmzUumjX
	obCni6oyD8bvvOZmUC36GMN1t5N9Q65w0Ty7Y+TxdzNRcNc7GXJcipiYMr8ecyuXhq2QO0Ojg8i
	hR4stG5koYwFDGlklziofKt4gwMK6Eb30zd5ygw+abb+my3VK6U1f//gBdH8ZYlk=
X-Gm-Gg: Acq92OEv05a3Slksn4XJT6Fe/qRw7w6IDfe5aJu4pLSXipbBZqoDwyzNpoJ0VTU6ytX
	rMeVpc3UUpkEteA9nhDtAMonywOEBjmcwaBGHM67ykeaTNWw+Qz+/dIy1zbio+/XtpqJel2z3VZ
	q8wJ6NZN7Dwq+giuQfSK8aVkerMhY36zsPMBC9ELyD/RtplPnBuVXinTnj2qjMlb5/AoOk+1Y8b
	oQEIO2omTqm4ZloDUvP0kRvjp8VmBMXzVcoPxT8bOurIz50pvySybI6JtVsO16hzSeL0XlYprlv
	RIVxyQrz0BXxKCJIDIhw3mfVNqwEb9q4lOzge9MJ7jlN24tf7YbaqMFpS9dStCl/CmpPXSzFBOh
	qezwTSShT4LumtspUhTUByQGl/Wf7BAA2FnVghrVcEBNhE9YlLA==
X-Received: by 2002:a17:902:ebc3:b0:2b0:6e6a:8504 with SMTP id d9443c01a7336-2bd7e973c40mr258310135ad.27.1779269949189;
        Wed, 20 May 2026 02:39:09 -0700 (PDT)
X-Received: by 2002:a17:902:ebc3:b0:2b0:6e6a:8504 with SMTP id d9443c01a7336-2bd7e973c40mr258309785ad.27.1779269948744;
        Wed, 20 May 2026 02:39:08 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe8baesm217052215ad.47.2026.05.20.02.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:39:08 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/3] Add Cypress CYPD6129 UCSI support for monza SOM USB0 DRD
Date: Wed, 20 May 2026 15:07:31 +0530
Message-ID: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TqH9YhcUXTrzDBqfsKuFJJsISs6kdY8Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5MiBTYWx0ZWRfXx/QYQervVGOO
 l8t5vEwHWsHJNXrCBoI1XNjiFKHsV8IqyLXLTRGTCmaxKiC2XBGcKECSlgM6aceZnVCzYmPlCMJ
 6FhCzgD1RYhF4hbd2gNJSuSREZRIKVBkifqigHPwZ6aEWezka81VnngsGWQ8dT5yCNAFmKrKPSx
 qB3SYgUjoO4eaQzrt5Ua4rnlBl0IUfSA/sYSKnvG8v8hd4cwzbDz/umFcaaXW/ccw2OiCLAIYh8
 o39XU6mmFGB/1Xn9i2p6xQSQFzDUgJpmcitc15YsqjUnlEKWX4vrRma+3D+MWUKCdjvAMkbHp58
 9rBmKgKCWXHYg21CZpdEt0ZIDpRb9HCOFDcCn1wDLNYDrgw7mIiHm7Yx/KjNxdFYx4cfD8K6Key
 MtWi83hc059ixKX8d3NqZu1wD5E0CU6eU7SY2Ke8G3M2MoZlDn7iLXVNt5P0DSwQpvDJ9oMp+DI
 6ii/00i57++cuqOUGwg==
X-Proofpoint-ORIG-GUID: TqH9YhcUXTrzDBqfsKuFJJsISs6kdY8Q
X-Authority-Analysis: v=2.4 cv=C4LZDwP+ c=1 sm=1 tr=0 ts=6a0d813e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=C9H03ch1PF7tVjC8yJMA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200092
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[akash.kumar@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37755-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 16A4858B05A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

This series adds support for the Cypress/Infineon CYPD6129 UCSI controller,
used on the monza SOM platform for USB0 dual-role operation.

The series consists of:
  1. A dt-binding update to document the CYPD6129 compatible string for the
     existing CCGx binding.
  2. A driver update to bind the UCSI CCG driver to CYPD6129.
  3. A board DTS update to enable USB0 DRD mode on monza SOM using the
     CYPD6129 controller over I2C12.

This enables the USB-C controller, connector, interrupt routing, and the
USB2/USB3 endpoints required for DRD operation on the platform.

Akash Kumar (3):
  dt-bindings: usb: typec: Add Cypress CYPD6129 UCSI controller compatible
  usb: ucsi: ccg: Add support for CYPD6129 (CCG6)
  arm64: dts: qcom: monaco-monza-som: Enable USB0 DRD mode

 .../bindings/usb/cypress,cypd4226.yaml        | 73 ++++++++++++++-----
 .../arm64/boot/dts/qcom/monaco-monza-som.dtsi | 57 +++++++++++++++
 drivers/usb/typec/ucsi/ucsi_ccg.c             |  1 +
 3 files changed, 113 insertions(+), 18 deletions(-)

-- 
2.43.0

Thanks,
Akash Kumar

