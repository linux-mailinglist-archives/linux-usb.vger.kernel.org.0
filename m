Return-Path: <linux-usb+bounces-33878-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YF04BS3GpWkZGAAAu9opvQ
	(envelope-from <linux-usb+bounces-33878-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 18:17:33 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B04981DDAD0
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 18:17:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9841930A781D
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2026 17:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 120F8426D0B;
	Mon,  2 Mar 2026 17:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TnSujJy+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hE7gOQYt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794762FE58F
	for <linux-usb@vger.kernel.org>; Mon,  2 Mar 2026 17:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772471418; cv=none; b=C/LCmoBtpMKsrkpU/efRTpW09iQ/Oxxm01jVhtA72y+qHJK3wjYYWt7vb475ZLlJyeeOubLzGB0FTE1ubRWdk4DGlic76P+YmI+QyL7Yhf+OByglKlqmMzqT8nTdGq/A6f1Co/ygrkZeopQWHyh6dlErwNcKYiFSTF+9pZz/soQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772471418; c=relaxed/simple;
	bh=dRhznW5/dlWq5GOVkXwKFaB7DrlVxl/dxZOdBStUcfw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=epjnOlrB573XtvV5SXZsvjTDaux/D/ej3Ka6TqMCLAfhIsBmxTfmp5F/44d7+QDlwbzgC3iix2LfTRpbFvcd6AxqVqh2shV9fOP7miF/wn23JnkKbMuiPQZW00QD1AB3/gJR8NFGQT0j2lsSrCodyjB6DiBNE5zJvmkn1iH+S4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TnSujJy+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hE7gOQYt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622ENW3L055870
	for <linux-usb@vger.kernel.org>; Mon, 2 Mar 2026 17:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/zEIDOoOm0zzYm1ritfcPR
	VCFZrSbI1jqFWUb+sw1DE=; b=TnSujJy+k0rYm4BfbVwf1KoA6rzeFtQrxvoHDR
	RvbnRvtg0SQqzQY9tehMM471lq5/H/uBfp7qEbd0ahydy7oAO76HcjsOgDeM+RWM
	1xkE/DzTExzCqgMVtUT+NZwH87dcPZKQ/ElT7Ayd6GGpqTP22wOUUL9ZLksKBRGW
	Ns6oSWG+5xV6Tl+25KOiwmzh7qqqT8wdRSayCFfOrKblsMAKvNpNcYBz55jAEra7
	MJUWeyOR8iMlj8KErpBBlvJrZaqxubCrU9cOm5GhCuO34rEbxRaiH6B+dt+fXvdH
	sE+GTZdefI+odpZbbt98JqvYjRtkI8LBfU/HlhTN8pu8eCmQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmw64bas6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 02 Mar 2026 17:10:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89546cbb998so434398616d6.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Mar 2026 09:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772471416; x=1773076216; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/zEIDOoOm0zzYm1ritfcPRVCFZrSbI1jqFWUb+sw1DE=;
        b=hE7gOQYtoMKDziaj8PJh0W/+nPdSYFUcl7JcrKEY2I1pCbjbO/lo2lqQxXC7P4yaRH
         7HSZjfvhIRuo4+elUY5VcES0g3ghfO5wN57JjNfLvzeExsMzKvRU/8blkWg9+poxz6v9
         fyhrKsIHAgSHfP6rN/Y2A4trW8w2U3wjgOdru+UE5GZUIvHzWwt0XAk5/LE47cXNnlNu
         u28HUdSo9s8tUceKwXP5zzVsWfqGU5SWUEnoV9H9iVO4lC3rxx9LHD6PbhSu0eJaOImo
         wpEofD+w2mqFO1TvX8JyD6wgY2OUEBG7h9N1qjbKgA8tIIMR79A5KWmjJFrlCHyyAVgI
         DQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772471416; x=1773076216;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zEIDOoOm0zzYm1ritfcPRVCFZrSbI1jqFWUb+sw1DE=;
        b=iKg+Jc7rymBKbD7C9g0arwiSKrsc8BPmzPby4rip2Gp7GQgkoNDVOrAvGbeOsSO1Ue
         JQyYAm8xAm00c6r1KdhEo9G4ttPVm3K4rRUuuk16LAUuhyYbQ2+iyxjGZ/xIpgmIf66a
         4aMjAulfUGXUf3oMlvx4pPsYer+j2gz5+hAHmj54BlnykX9OcdwizkgMWxNghQ2fFtUN
         AdTO+CAV6iiNJfRgvkAU+U0DlLIaCf3PBdEGUKxjZkcKWwPF1A0jBhp/nnkJGc2Xk+mE
         Vuo2da0itzftFnm8Xv4DXzmeYK9x7nzjq+DZErwrBLtniguj1rB60WBKMX8axPaLha0t
         VVew==
X-Forwarded-Encrypted: i=1; AJvYcCVzllViuZQwEEt09VVl6O8Cz+LrJaQktzblXkEyr0+JvLFKMwwRXJxMq23M8jGEATTZFtOTd5vbRO4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPJYhCLWaKpISEekzE7LipETlpa3qkaZfACoZb+cM/jmxIYHXU
	Ie3qy6XgBRsro87E+uWLZrUQHn+tyWe7V5vP1NEs5bwC4taZWxvCOn2rdLjrzS6i3KMw1+bOAQH
	4UajuAmR9vCI+QP3P18ZlEL92eG0KoLoij+Z65LceZmtQlte8WSUzhviQJgzCzgA=
X-Gm-Gg: ATEYQzxuSJC/xDexBcepQs9Fvxml3hBLVqeSfvbRr2UpqxveY40aUjn4dqJchaYMmcc
	uvxtq6BZ7wBB5xoktG8Y6zl62npSBZkevj2UJ3KwcqUPvbcnwCJKei9KLRu7EJpFdi7q88EqvgI
	C/aXD62SOeUArYmysKfCx6YEVi6UEbpZbHicJVluWXUWP5hj57geXM1GK+fcjWdG/MYQqG2POOS
	KRL06OLB2jEKA5Je4hgTBNIUCrtk2kQ7J53cuAyVFVfVK4pvBS4qnxAlc/YLZiL5YmG13srafWv
	yja+YZXu7Tj++nBsPHeKfgC965wn/fkYr5PiwnshF4V/ftYJIy1xYyza1aIEOqoGzeh04Y90e0l
	937ETaEOvkndD/NbT/CeYIJ+Dl9U2fg==
X-Received: by 2002:a05:620a:4892:b0:8c7:7a3:501c with SMTP id af79cd13be357-8cbc8df715fmr1595909685a.52.1772471415410;
        Mon, 02 Mar 2026 09:10:15 -0800 (PST)
X-Received: by 2002:a05:620a:4892:b0:8c7:7a3:501c with SMTP id af79cd13be357-8cbc8df715fmr1595902385a.52.1772471414655;
        Mon, 02 Mar 2026 09:10:14 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b4175fd2sm12824083f8f.14.2026.03.02.09.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 09:10:13 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH RFT v3 0/3] arm64: dts: qcom: glymur: Add USB support
Date: Mon, 02 Mar 2026 19:09:51 +0200
Message-Id: <20260302-dts-qcom-glymur-add-usb-support-v3-0-883eb2691a0d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF/EpWkC/42Ry2rDMBBFf8V43TF6OLaUVVf9gNJdKUG2xolSP
 /UwTUP+vbIT6CKBdiOYYThHc+ecOrQGXbpNzqnF2Tgz9LHgT0laH1S/RzA61ikjrCCUSNDewVQ
 PHezbUxcsKK0huApcGMfBeihoWRVaasJZnUbKaLExX6vhPX19eUs/rk0XqiPWfmHfxixOIfr9b
 bZD59Tq3yarnRHJSC7pJqNScClLoKD6I7ZmCph12GKv8ft5cC6bgmrjH7ssPgv9nkUlhNF5i6r
 bzXx3XWZnem8HHWofU4BZAAFRY465kFhVxf/QnDAYD6drSB2ngDEeBp36RLA4ovJoYRgXhWphZ
 nELXTUlzeuSkc1jSaUcwtIwfpsUGhlvBFUbJGuaB+P8YE/rDWe6hnc9F+V/nmumcUkpdKG5KHV
 D6L1/UczsF8vYP7AsYpscScOFrhjVD7CXy+UHdN70i38CAAA=
X-Change-ID: 20260109-dts-qcom-glymur-add-usb-support-617b6d9d032c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2869;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=dRhznW5/dlWq5GOVkXwKFaB7DrlVxl/dxZOdBStUcfw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBppcRskoPtaka2ti3vE3DZ4U/sy/jRX6k9ViBCA
 Lh+IBxpGdiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaXEbAAKCRAbX0TJAJUV
 Vj/sEACbE0l8uouNW9/Z9EoMNbgB23kmQLo/1Rb2VXFHKbu9Bm+nNh8REeactXRVreSyj1sTJzA
 OzDkloaGUX7/TSsOBwSm5x5LwAoSD9p8l8SGjS9zyfZytfhRaeIWF3NTWJAQvw24da94Oisc5I6
 fttmfRO4V4uX7U/BzR9eHMnN+1hZCQniUVtOmb7QjBTXQawDAUkHunRlVrqt5RLdniyEr+VbKQC
 nABiNJQ7A7Yh0M4HbOQM1EspT5HnCEHSchLhcErvRUiv5JNqQTW7x4/uT0yHbZz6Qefu/8LrVlx
 NFraC3KbJ4zwUtSCvlKxTUhavUqNhpcqPXK+MJwDrCieaUpIDOXcMmfmrrLgM1E5zykFn7RNVNp
 q9WUdPWuZZ4rMFvtx9lxP49KM6nhBKY8r1KVIllj6lm8/QeLMUOM+3tYUTp+O1YWk710fUn++Mq
 RmNvGWjaWlvr+O5nj3YNa5w2UJN8Jp3h4lj1UllGEiOcbVg6iqhadhvtVH0fLL6lRrJah6PsfOs
 KS+AynaQdJxO8Mt57UnnS9vmbILwwivN+7U+gA8fL7DL7tJI+E6YQE7NVXmyuKHNWM+U2hrijzw
 3vvOYzYYrjiQGYgJ3EmbeNG+PnfUc2sm0NxGnt5Lor9EiSdIjfbbuT1TlB2m9vctimzrmiUSQeh
 EQMc/YLDYWnMQYw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: ld5BHE0JOMf_V_hK5LXl_QAoursWfX4c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE0MCBTYWx0ZWRfX2l3bKl/TKO+z
 Dg4zPhS+bNrCpp/IDW2gZyfaWCHfBwdBY6VHeLyT+6suNbEE4ihzhSwscl1SwVoQ5O0m3OnMQYD
 Hqm9YSJBpy7Qit8PUkXl49N0K0d9A1J+X0KovqHqyEHf4t2UPbStZSIibYscDVM9e3apNfahqKX
 /3vCCRC6QoLZmTtVuJTXbREqX+hABur7WPe+iIEhDteDmT5dIAdligIB4FlLXBAQ9KQh3tFhzcT
 OCUfwRB+qEZVunotu05oNQ4K0OQm2SCnqdvbYW5CsmyA7WKqHz79nQfCIkjIhca+3w+TvN+LKI/
 iFLOz1Rg+FyQ2gc9L1Buyx8KhNxssGBE28CDlaVSy1DVdO5+e4DNpEXPavbvrxlEg6lHqJ5pQC7
 d7qk7OhoTVPKnX/7i3WoKgvxH/BUq54yyqhJYt9r1j8gwahyD6K6IakVX5k+8QymdKef/HrXl2R
 KkE1S5SMWWnCgZkRCxw==
X-Proofpoint-ORIG-GUID: ld5BHE0JOMf_V_hK5LXl_QAoursWfX4c
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=69a5c478 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=fcrENYw6Eu_lQ1CEjacA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_04,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020140
X-Rspamd-Queue-Id: B04981DDAD0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33878-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,msgid.link:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for USB on Glymur SoC and its Compute Reference Device.

It adds the usb_2 controller on top and addresses all comments.

This unblocks the upstreaming of the display support, since 3 DP instances
rely on some clocks provided by the combo PHYs.

Sent as RFT since the latest tests have only been run on a remote-only
available device.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Dropped the PTN3222 USB Redriver @0x4f, which isn't there actually.
- Dropped extra newlines from pmic node, reported by Konrad.
- Link to v2: https://patch.msgid.link/20260223-dts-qcom-glymur-add-usb-support-v2-0-f4e0f38db21d@oss.qualcomm.com

Changes in v2:
- Picked Rob's R-b tag for bindings patch.
- Fixed CRD DT commit message according to Jack's suggestions
- Sorted nodes in board DTS.
- Added proper quirks to all controllers.
- Added RPMH_CXO_CLK as ref clocks to the USB [01] HS PHYs
- Replaced 0 with 0x0 in all reg ranges, as Dmitry suggested.
- Renamed all usb_ss[0-2] to simply usb_[0-2], and the usb_2 to usb_hs
  like Konrad suggested.
- Link to v1: https://patch.msgid.link/20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com

---
Abel Vesa (1):
      dt-bindings: usb: qcom,dwc3: Allow high-speed interrupt on Glymur, Hamoa and Milos

Wesley Cheng (2):
      arm64: dts: qcom: glymur: Add USB related nodes
      arm64: dts: qcom: glymur-crd: Enable USB support

 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    |   2 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dts            | 271 ++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 691 ++++++++++++++++++++-
 3 files changed, 958 insertions(+), 6 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260109-dts-qcom-glymur-add-usb-support-617b6d9d032c
prerequisite-message-id: 20260209204915.1983997-1-anjelique.melendez@oss.qualcomm.com
prerequisite-patch-id: 66643de4d7142692ceee6ab78d4c1fb446182123
prerequisite-patch-id: 056da4cc346b633ccf7e12536839eeefa9469b78
prerequisite-patch-id: 3d3c5004e30407229b8f6612ee2c56dd6171447c
prerequisite-patch-id: a4ed5f8f3d10b47b0d1daee2e0dc44090c13c01c
prerequisite-patch-id: 144090e55a19a1479f4b35b75f9e5b80a9b919f0
prerequisite-message-id: 20260219-upstream_v3_glymur_introduction-v8-0-8ce4e489ebb6@oss.qualcomm.com
prerequisite-patch-id: a9ccb06216435308c295e2de9adffb79060439cf
prerequisite-patch-id: 1e8d403675640d7db68a4c0caf28d1b1be895e8a
prerequisite-patch-id: 09bf515a2cd6bec5b21f15b18bebdb172f4b4a57
prerequisite-patch-id: e88699eb550ada640f5f2f5e4f432d6a3ae2552f
prerequisite-message-id: 20260302-phy-qcom-m31-eusb2-make-repeater-optional-v2-1-dbf714c72056@oss.qualcomm.com
prerequisite-patch-id: df42484b224c01014637ec5a8f56bab459890557

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


