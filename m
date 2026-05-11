Return-Path: <linux-usb+bounces-37251-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKZ6ONO2AWr2igEAu9opvQ
	(envelope-from <linux-usb+bounces-37251-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 13:00:35 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E99350C684
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 13:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65AD93041A87
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 10:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC723BD63C;
	Mon, 11 May 2026 10:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8QJ4sdY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YO4Tdzl+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD4A3D9051
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 10:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496858; cv=none; b=eSOLMjPtjb1H4tdBTYSMjaBi07dpbBWEJTp9zE3VzN9IpA0Yd69oU8S/XEOMT4VSeg4DqYGN/rGqon1lHoSiZILvTjenxUMkF0Khm+vEm9MBL2UJqGHoRvEdtH8Q+vJ2HF8XQF2UgJpFc4AH43/YXZrteLhhvznQptNYptDArs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496858; c=relaxed/simple;
	bh=Zq7nyiYGo8t0zBejjFLX6ASDrvhoqFDT/D1FMrri0Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bYiVXSuoOdCNFaA500CBU6EnxUm4Y+08mjpt1u7/1v7c3BN7D5mAi7nGATOMekrvVJCmRNXUzpR6Gb4XYFniZaDZe2JVgGbqIozoXeshgXshuiNs7CHzIgsYXMDnuthfZX+z5Ef7HOgcZgfEZFAGl9HsheTXvf9CHyIhZR9R4bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8QJ4sdY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YO4Tdzl+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B6gLsg774832
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 10:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TxocFjuN0LOAjgweyXXNhrSSGQgx5Dl/pI1l7dwYsLM=; b=Y8QJ4sdYNG0tl2UK
	FU5oRfpx5ApMhP51wQBqVYIbKTTM092/F3DjkkOuL2oHZIBJQZOurdFmp3QH/bFq
	MeiCPDLJm6SFj11z83N3FLu6bAtw+S7dT9IRRUvNd4ykev7mi2jZWCnq+WDBvPxa
	mFwYC62zKehdxRWWao/gN9Dj717eZ5yIl5iBk4Yz634tsXY3PYIGO4TLCC2s2XJk
	Id51kKYCKXPk2HSwRIWOcXC+6JRUCRWXPyMmGbzYuwLiLO716635fpa/RAKDfSOs
	RuwZmSlNpr2m+GDXRE05L37UMX0aY7l2b9TPy4HIaNG3xiK4F11o731NjZ7JQXHp
	uU8eFw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3a32gvuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 10:54:15 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-63146b7289bso3914218137.1
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 03:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778496855; x=1779101655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxocFjuN0LOAjgweyXXNhrSSGQgx5Dl/pI1l7dwYsLM=;
        b=YO4Tdzl+xskawoT4reUIaV2qqymd6TpT6Z7Hqa77lP9hNPmc6Dv1CUATsekVnPp2AM
         cAkhMK53LhNCMXWSwsRJ+bpjr/McB6AuDeiXyHfsle/B8adZCrEIVQXgJ0h28leDeWSi
         lr7vHXrRlqs7n35fhA4AF/MfES2DVytgbe/6x/57n9o3sexk+Y+IqhY7nVPYICVr4NnL
         qXAi4Xm+j9JmYgsocDa2tlM6ZewjxbD/ehuCty7IvFe76copqBsJOkJR+FCt0HbNSr8n
         gK0v3x2/jvi6pe082OqJrfdhobC+QPEMHhQ9CUwMb3Y9rHSW3N85hs61n2SI9QE2XNmz
         zqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496855; x=1779101655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TxocFjuN0LOAjgweyXXNhrSSGQgx5Dl/pI1l7dwYsLM=;
        b=amJHshzzUd9wzDSwGAFfoIG/3zjcJvZwSeoDLeAEerpamPyRh5AHhD77ehFcf8zLfF
         XrE8Tan3xnJtsT4xQVJIpr/tC/eo3mf58DxV0agxufGQ8HsUV81LDBvTiH8JkZ4Tjn62
         49OhdpzvwaoyyerZuy90EoRjL6/gJk6jcEja6/V8NGXHBzFudWnlE2SYZACY9WxWyMcB
         t/4FGGzYOCsSN6UWK38RQTj16bZkYRVwiqEWgZUZr3qp9sl3UtIaL3tNW6Hw8kq8MmfK
         TPiynDJBG3GJlCOHWGejVwpBw6Cx9rs5I4GEHljBeF7hjAcZJiiqTs8NWSdaSt53d5LI
         qK4g==
X-Forwarded-Encrypted: i=1; AFNElJ/NDND1G2fdyAGYH2Pk5tjwtRekXEkuZdzx42Zv7ut1HlpwKMs6sYfbw2djfMchyNgjJotOG6ix704=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPfZZ5u7HTHn3n1n53L3jx3eu2eC5yw7E+RidxyIqlHJ/NhvZL
	rx6eBQmISlN9W9AvzHdeVFaWIS7mWR86SXLc2IX1vuFWZGEzOpiZ+o0obI3KkG+3AvgxE2GFfH5
	bpCEtDn8adq+9xFva/5bPOrVAkKUOFqRoXRYE2tPEunAYwwf5XBqodUIs9/9jX9M=
X-Gm-Gg: Acq92OGvWv7fxPVNVG+KILtt8uAvO7HKjVlKtMn/TgAcTLnDVyp9e4yd0P1NVv/p8l5
	2sOC7YsDHrijsNQoUMkf9k/PQGMHjOzNoGafKWdSXOz4S96WC29gWwZSdbWJzpwTIwjOtKVtuVz
	yNtRyCdsDvwxarijQEZ3i5Wjkm7LvF2U5onmO+Ze+gNnsAgy5FpuH8Ouj2oEoa6KZP2JE2HUlyR
	dVoDVZBLpqwVBIVY2AaAdFjoEYcC6MZU32/OBOwWghA0sudP6q/9wBS+v56fOvkL9mfXfxtNtBw
	NK03T9I0o7CooGKCKi8XiRZ5Uz52MREPXJyaYlMo1rIgoVrJZPRPFZF9pDS/ORagj9n9hmp431I
	tO6LozyGRMdIyaRHlIH6nDTFLuEcDiFYY9d9ycNVMn26JPDyjQQ==
X-Received: by 2002:a05:6102:5e98:b0:634:92c:bdcd with SMTP id ada2fe7eead31-634092cc426mr1122835137.1.1778496854860;
        Mon, 11 May 2026 03:54:14 -0700 (PDT)
X-Received: by 2002:a05:6102:5e98:b0:634:92c:bdcd with SMTP id ada2fe7eead31-634092cc426mr1122814137.1.1778496854416;
        Mon, 11 May 2026 03:54:14 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:63bd:c2f9:cedb:aa32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcca389b209sm299738866b.16.2026.05.11.03.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:54:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Jisheng Zhang <jszhang@kernel.org>,
        Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>,
        Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>
Subject: Re: (subset) [PATCH 00/12] Add TH1520 USB support
Date: Mon, 11 May 2026 12:54:10 +0200
Message-ID: <177849684249.46127.338857521767724625.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: u4Yoj0JkXErcf9ZHlFQPyIY_sBS-leyg
X-Proofpoint-GUID: u4Yoj0JkXErcf9ZHlFQPyIY_sBS-leyg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEyMCBTYWx0ZWRfX+wKfx5SrOZSM
 ysvlVGWAajwWAlfFymAwj3d2Eqg5s6HRPwMbrNklRak6F+7ymQksk3hJeTBr6CNf+KRMzJuqASD
 kXiwuV5KkJJ0tGyYmU4PyqMIbMBF3yXEx2ISViiZLO7N0FytEXzzHtyOPQwKcjmIkxPi90qissq
 v4GOXu2vKeJ2JXfcb6AGfin84KVhF1C5k+IbiqSey6OSGajv0lA/Vc9ovqBP6PlJIaGYbuAEhIw
 QAWJviP19NGsv9qcLf3NTsznNIkyCRTXf3OUmeNReibPm+4xmZjkJH0z1R2PoTsxMgiSE+AKCCU
 bqwjvmoEXN73wwJvAjg8/beBAG/lnp96L6tBxY3m2GVKf6yDbmhT5rSJMgaG5ggttLJYlj2VidP
 Lkgs0c9vMPL6t+l9E8rshihv6jEUbck4/7eOEp4NL6hxRF3ca1EAHaoU910skuysRJFCcugixSG
 SQR4Mf4pDE6psFBihkw==
X-Authority-Analysis: v=2.4 cv=SLVykuvH c=1 sm=1 tr=0 ts=6a01b557 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Ij283RjCuas_M8ejfCoA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110120
X-Rspamd-Queue-Id: 4E99350C684
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,pengutronix.de,lists.infradead.org,vger.kernel.org,icenowy.me,gmail.com,disroot.org];
	TAGGED_FROM(0.00)[bounces-37251-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Thu, 07 May 2026 16:16:58 +0800, Icenowy Zheng wrote:
> This patchset adds support for T-Head TH1520's USB functionality, and
> enabled it on the Lichee Pi 4A board.
> 
> The first 3 patches add support for the MISC subsystem clock
> contrtoller, which contains some USB clocks.
> 
> The next 2 patches add support for the USB PHY of T-Head TH1520, which
> is a wrapped Synopsys USB3.0 FemtoPHY with a little integration quirk;
> the controller itself is a properly configured DWC3 controller with sane
> default register values set.
> 
> [...]

Applied, thanks!

[07/12] dt-bindings: gpio: dwapb: allow GPIO hogs
        https://git.kernel.org/brgl/c/f76c8be440e53465a306c95a7d50ca8675252f82

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

