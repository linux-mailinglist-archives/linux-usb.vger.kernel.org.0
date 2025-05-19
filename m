Return-Path: <linux-usb+bounces-24092-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD46ABC6F4
	for <lists+linux-usb@lfdr.de>; Mon, 19 May 2025 20:13:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E67C63A7C88
	for <lists+linux-usb@lfdr.de>; Mon, 19 May 2025 18:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9AE3288C35;
	Mon, 19 May 2025 18:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qm7im8mk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03454283C9F
	for <linux-usb@vger.kernel.org>; Mon, 19 May 2025 18:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747678432; cv=none; b=VpUoK9aFBarBx2sjsJRYlJ+FGwCPd0RYaC/DRfjbeQc8dFJtx1AKQQCBl8E6Y8hi8yKdPD5wZP6p4+i0frmppU4LP94oCAVNdRel0TtCAAJgxrGXwE4l53KzzFBXU7qzjw61CptjsNnX+gxxaS1ZgR0+vpWQ9IgcOAHDwYsa1Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747678432; c=relaxed/simple;
	bh=TIGgb4okBX/vll+qQ8jYm+OEmV6VojPTh7dBT/O+1YQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lzQbxcsgniPURxbgtjoEerShc/jGi8yW/FbPzutKxvKukdYiJmR0P0kYc8c985ffzTj+9FxHXSaltSyZDGshdSzDBsS4/VHmEVCixL+245R7geGh1YB+2I7sjg7UF13F+oCZMzOgslih+hl/mSt0enTpV6BIr1+uMFpId2qgHg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qm7im8mk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9ixqp022845
	for <linux-usb@vger.kernel.org>; Mon, 19 May 2025 18:13:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TIGgb4okBX/vll+qQ8jYm+OEmV6VojPTh7dBT/O+1YQ=; b=Qm7im8mkMHZMSlaD
	55nUCdaU2ec6hZyCKDQfkQtVp55GS3+6RVoalHhCRwY17X0ovyoF3bLA1jSUbQdq
	oHt/x68CPPh+tzIBA74H+fzS56Oh/Z9bnknwaDSApjF4E+YfRiFvp2EFpJdCJu5v
	zTT8jsxZ/nYJbdiHssz7yZeVqAV37bvjVFeJRZXuxXf7DtBZU33tOAOZkMpjPQXf
	B9wd6phNYYKH2IroS9WPPgnh8M5mYsl1f4UpF9jqakpGzsmzfpQjtugP4zGtT9A7
	xhcZ/8QmkCazqZJf8TV3LR/cGs5GovstpF3h9k3jTej1AKixgojyeQPQT7j6V1oY
	HwVPtw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d1crr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 19 May 2025 18:13:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30e9e8d3e85so3170846a91.1
        for <linux-usb@vger.kernel.org>; Mon, 19 May 2025 11:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747678413; x=1748283213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIGgb4okBX/vll+qQ8jYm+OEmV6VojPTh7dBT/O+1YQ=;
        b=SJRKt0XWYq4wuMrmdW6bX2Sthx1ZwdoRi1TryR1RPFJjrx0cBQDTiO10Aaosxiy/xf
         QBOm1WB75NKdzflcwCtCGMSyw1kXGrXOJ4RiKong/Bg8xEasbKzRX9CHufi2TdROKvIb
         F36ye8w828P/3TrXeYHSkOtAlcLkUNRahLgtKJfrbTl7BZouZyqXdwWDoMa6usS9tZhs
         teD/z7Myl8LPJMU+ig8tDsX/1wlxkJKG1ko1xQR19HnuHtny1IrBdHPGxqHJvUmGE5WT
         G/mtGz+wpA+9aMuTd22sSj6XZE3dIMCxoexOttq6MdldmGyAmGIJZ0VvNL7Lsq/VI6e8
         K7JA==
X-Forwarded-Encrypted: i=1; AJvYcCVCm5EWiXtdAnkKxt1FlQNp4wF2Ca+LKQKUt91UfbCuwZSZ4nJUPbock/ncxANTpVkJz6WAAGop4zA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0RxkJSdtOjF6wo+e21CkjWXsu2gHsQr41zhqAdmNfK3xEgEbB
	P7BMJo81A7HpnU3TwWVk0PslAKZFivfM+zYW42m/tXC0nuK751J+EePpGdG1iM8finzhRBjXkqz
	jB04OVCynZM//TaxtGueuL6DJBCbm/y2F0eRvRG4LPk1Ps0gwDJRXLkcz/y/1NyrTXLBvsivSYb
	u80rzekYUyyMCVqr4tfNXz2em7GlsLrXpBZHKw8g==
X-Gm-Gg: ASbGncvfaUkoy8o2x9u/PM+UBEllgqpdwTGy7pUgb48HuWDFLy/xNqBuQQqWAeIqwYV
	B2FgL3TtTJu57qyY0xyDzV8DW8jVnKXpTqdh9krQA5xDOzvik0W0NhAw0XJpIAUFxM91Rug==
X-Received: by 2002:a17:90b:28c5:b0:2fe:a79e:f56f with SMTP id 98e67ed59e1d1-30e7d522165mr20016488a91.13.1747678412765;
        Mon, 19 May 2025 11:13:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXiSZ+57NgWlBM17stmX1Q7Pk1mJNJiu1dJvz3tL2n2jDsMA/NqGwUXr0pTbyMR9VA0aqbRF6Cwr57mNkjxNY=
X-Received: by 2002:a17:90b:28c5:b0:2fe:a79e:f56f with SMTP id
 98e67ed59e1d1-30e7d522165mr20016457a91.13.1747678412392; Mon, 19 May 2025
 11:13:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517043942.372315-1-royluo@google.com> <8f023425-3f9b-423c-9459-449d0835c608@linux.intel.com>
In-Reply-To: <8f023425-3f9b-423c-9459-449d0835c608@linux.intel.com>
From: Udipto Goswami <udipto.goswami@oss.qualcomm.com>
Date: Mon, 19 May 2025 23:43:21 +0530
X-Gm-Features: AX0GCFtEvLTRHA_v2SuDhVKcrDTDc6HNjubfnir7k5AwZppJ-xNdbEg5MKkj1j8
Message-ID: <CAMTwNXB0QLP-b=RmLPtRJo=T_efN_3H4dd5AiMNYrJDXddJkMA@mail.gmail.com>
Subject: Re: [PATCH v1] Revert "usb: xhci: Implement xhci_handshake_check_state()
 helper"
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Roy Luo <royluo@google.com>, mathias.nyman@intel.com,
        quic_ugoswami@quicinc.com, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org, michal.pecio@gmail.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE3MCBTYWx0ZWRfX+4LYUFkoeZ0w
 1AxHCz56UlHS9J8afKsSqTAEhrWrdm9oLGxWlpecXk3dIL3keFQxLX3LhJGiMxR//hmCOVh5YCw
 6gZNb0F2DGjhBO4ocVX881I1pwkhrjb+z0SVbQSUbXIPInUeH/d3SuoorvoUblAh42vFPwu2kKU
 5QUQue8C+YDvprxtZL/ECjvzTqRXWJLNcN4ugY9OXfDskJ0iMyN6q/5jDEvkS+p/kdOEmCthqY9
 h8MjGIQMxOtfoUgq4uVbSvr5/lc+ESbQ3y2F8+mA4TAdpgFen+QnJfTim9jjirm5LtBZUx0fr61
 aJ7jrlbySZajbuxzi8pM/+5fCtmEsGT8ofh7IH/CeESJsT/abAoJiPqWezqPYw3oSnkHUGedWer
 o7emVFZc9AXoR7Pwc7Onm98Tp+HAoRPrEdKFCLMhjXtCgtCamnPrQBpwRSsf+8zbLs2pl3qX
X-Proofpoint-GUID: H2Yi7xvFIJ0G-XCNZepkAHMCnFfsO7_I
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682b74dd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=QyXUC8HyAAAA:8 a=t5j83SEWn0A7TGmuvnUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: H2Yi7xvFIJ0G-XCNZepkAHMCnFfsO7_I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1011 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190170

On Mon, May 19, 2025 at 6:23=E2=80=AFPM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 17.5.2025 7.39, Roy Luo wrote:
> > This reverts commit 6ccb83d6c4972ebe6ae49de5eba051de3638362c.
> >
> > Commit 6ccb83d6c497 ("usb: xhci: Implement xhci_handshake_check_state()
> > helper") was introduced to workaround watchdog timeout issues on some
> > platforms, allowing xhci_reset() to bail out early without waiting
> > for the reset to complete.
> >
> > Skipping the xhci handshake during a reset is a dangerous move. The
> > xhci specification explicitly states that certain registers cannot
> > be accessed during reset in section 5.4.1 USB Command Register (USBCMD)=
,
> > Host Controller Reset (HCRST) field:
> > "This bit is cleared to '0' by the Host Controller when the reset
> > process is complete. Software cannot terminate the reset process
> > early by writinga '0' to this bit and shall not write any xHC
> > Operational or Runtime registers until while HCRST is '1'."
> >
> > This behavior causes a regression on SNPS DWC3 USB controller with
> > dual-role capability. When the DWC3 controller exits host mode and
> > removes xhci while a reset is still in progress, and then tries to
> > configure its hardware for device mode, the ongoing reset leads to
> > register access issues; specifically, all register reads returns 0.
> > These issues extend beyond the xhci register space (which is expected
> > during a reset) and affect the entire DWC3 IP block, causing the DWC3
> > device mode to malfunction.
>
> I agree with you and Thinh that waiting for the HCRST bit to clear during
> reset is the right thing to do, especially now when we know skipping it
> causes issues for SNPS DWC3, even if it's only during remove phase.
>
> But reverting this patch will re-introduce the issue originally worked
> around by Udipto Goswami, causing regression.
>
> Best thing to do would be to wait for HCRST to clear for all other platfo=
rms
> except the one with the issue.
>
> Udipto Goswami, can you recall the platforms that needed this workaroud?
> and do we have an easy way to detect those?

Hi Mathias,

From what I recall, we saw this issue coming up on our QCOM mobile
platforms but it was not consistent. It was only reported in long runs
i believe. The most recent instance when I pushed this patch was with
platform SM8650, it was a watchdog timeout issue where xhci_reset() ->
xhci_handshake() polling read timeout upon xhci remove. Unfortunately
I was not able to simulate the scenario for more granular testing and
had validated it with long hours stress testing.
The callstack was like so:

Full call stack on core6:
-000|readl([X19] addr =3D 0xFFFFFFC03CC08020)
-001|xhci_handshake(inline)
-001|xhci_reset([X19] xhci =3D 0xFFFFFF8942052250, [X20] timeout_us =3D 100=
00000)
-002|xhci_resume([X20] xhci =3D 0xFFFFFF8942052250, [?] hibernated =3D ?)
-003|xhci_plat_runtime_resume([locdesc] dev =3D ?)
-004|pm_generic_runtime_resume([locdesc] dev =3D ?)
-005|__rpm_callback([X23] cb =3D 0xFFFFFFE3F09307D8, [X22] dev =3D
0xFFFFFF890F619C10)
-006|rpm_callback(inline)
-006|rpm_resume([X19] dev =3D 0xFFFFFF890F619C10,
[NSD:0xFFFFFFC041453AD4] rpmflags =3D 4)
-007|__pm_runtime_resume([X20] dev =3D 0xFFFFFF890F619C10, [X19] rpmflags =
=3D 4)
-008|pm_runtime_get_sync(inline)
-008|xhci_plat_remove([X20] dev =3D 0xFFFFFF890F619C00)
-009|platform_remove([X19] _dev =3D 0xFFFFFF890F619C10)
-010|device_remove(inline)
-010|__device_release_driver(inline)
-010|device_release_driver_internal([X20] dev =3D 0xFFFFFF890F619C10,
[?] drv =3D ?, [X19] parent =3D 0x0)
-011|device_release_driver(inline)
-011|bus_remove_device([X19] dev =3D 0xFFFFFF890F619C10)
-012|device_del([X20] dev =3D 0xFFFFFF890F619C10)
-013|platform_device_del(inline)
-013|platform_device_unregister([X19] pdev =3D 0xFFFFFF890F619C00)
-014|dwc3_host_exit(inline)
-014|__dwc3_set_mode([X20] work =3D 0xFFFFFF886072F840)
-015|process_one_work([X19] worker =3D 0xFFFFFF887AEE46C0, [X21] work =3D
0xFFFFFF886072F840)
-016|worker_thread([X19] __worker =3D 0xFFFFFF887AEE46C0)
-017|kthread([X22] _create =3D 0xFFFFFF8937350600)
-018|ret_from_fork(asm)
---|end of frame

