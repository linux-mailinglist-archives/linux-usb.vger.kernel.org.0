Return-Path: <linux-usb+bounces-31953-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B01CF7CA2
	for <lists+linux-usb@lfdr.de>; Tue, 06 Jan 2026 11:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E561F302B121
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jan 2026 10:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0323326933;
	Tue,  6 Jan 2026 10:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bm1jKIbz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AJEy/IJ9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37702314D07
	for <linux-usb@vger.kernel.org>; Tue,  6 Jan 2026 10:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767694939; cv=none; b=KQFzb2Q4MSXQMu+pH7f2qGh0DMqavGieGDCLAcZPBezfGmvx+LwtL4rAAn5c+5ZtdM7TU8//7H2MK6VGd2Mw/cWX8Y9lRPpJDLrWqZXUbgxWeDSF3OHpc87tJIgojb1DZnmikDwf7/uXAjZXZlM5z0gviQTUGiaOz/rEH6bHNVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767694939; c=relaxed/simple;
	bh=J0SIs5/RqSV6z+RdyX8tQ9jEUDGOVLSk7q73Pkj1wiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LjiL5k/yyTB9q/IknSnXqggZXRvl14WjbYuNfS6HToQytLkNy1eDfUAeikacAkbQ/xS8zfN5f/oFKbx61ZnO082FXzYO1DUeBMEjDTs4d4ANmbu431pyijnLEKY4sVFVVxheQ5XbWy6jwXqV8aWxEZY37duMCBk9ipCHKDtYhyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bm1jKIbz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AJEy/IJ9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QHLi2922805
	for <linux-usb@vger.kernel.org>; Tue, 6 Jan 2026 10:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V46HKmVC2zhP75uahuQ1UOcgInckiV0+ZoZWNCJoijA=; b=bm1jKIbz+aS51nl2
	U1Wyc+AFE5r4F2xDrDTlYQJWAl1AWGCleZjRCbC7XRoJpOAp9ykFzetlgQ6Ic+XA
	hqUNyX104xIuEnRT8K0OJ+MeETn73Bo4xA76b5M5KAe8bEU5r/Ex0Xv8uHU4/nNP
	VU3UE2sz4CsWNSytxdkluWyQq0iG7jPin5OASl7DPPG/Jck5103fA52MRymK1caA
	kM2/JIxukvhql/fL6gK/g9YEuOQeN10JUYTp4nONkK1lDZQ3LZXZDsIewkk+lA41
	oA57Oj8bTj6mdI8JCx3LRpemAkukvEIAfCzyG5HJKeTKwNZKG99NhA6cK35CqXyY
	xkjuRw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgscy9bb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 06 Jan 2026 10:22:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b99dc8f439bso1802584a12.2
        for <linux-usb@vger.kernel.org>; Tue, 06 Jan 2026 02:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767694935; x=1768299735; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V46HKmVC2zhP75uahuQ1UOcgInckiV0+ZoZWNCJoijA=;
        b=AJEy/IJ9WCBb5CrghXA7B736EkZq/VnSfJE0AyOy0KqlItt9Dena9yjIa94npeFDxx
         wXwuKCYD78G8USoZfN6V+72DG/K7adYv7oyDr/AEl+N+VBqbwkQoSo+JKsCQRR3c27ZS
         ZD2/8AJnc/W2J1QVPA7OAnCXX86I/FeWApJHIeaQFnS5v0t7ZV6IElkvz403Wz/ii5VB
         u2Mepd1gjJ8gu8gKawWNI+13E/NFvGuKa8cyK0qC998C5SemkPcXZ34cOVwliGaYn4C8
         q/wZYUYgmj7qPJHT1RpO8Y67U5xTaQlNR+lhnypJiU9Saou89f5K9P/1kCUPx6F2P+Vr
         5/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767694935; x=1768299735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V46HKmVC2zhP75uahuQ1UOcgInckiV0+ZoZWNCJoijA=;
        b=gvoCUZJOBYOwZyjUvJlr/m8lueJdp4vM0gPJEeHv60XY1PFaC8eKPn2mv7IwTzn5h8
         hhy1Cf3kSFkZ+miNAefnaAQJVW4xR1Zd7/LUb89VcMIs8TovphF2SgIlAdCm+V/60nzV
         cfAlS5Jp3Dc9br7MrEQeTGP8rj2OYZr69ySRwkv0n4S/7QyFGM1hh88NcG9PDyyMvBRn
         c/yC+1QSD3V7tsMwQNrkQc7LEp4AIrZEh/UujUeYPn2QzdeSUcGH2dMqNnw2c80uaWK3
         AfFNRjrbtLqzp2T7Mwq8HRWxH3/NroESMdpw/bn95Ddr3/AFxAfkeWe+U6OI+oUxANOT
         n3Wg==
X-Forwarded-Encrypted: i=1; AJvYcCX7EJW4jb2JdjZqG6lI1UVqS4kB0xcBIEeVL8UFrQ9fLwdPfh6OI+2ahAt1Mj3X3xPOz0Gf/x8ejjw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuqrrT4TbkcPYl2hQ7jhmi8S8Fnho98ltJqoMr56VbTfq2q//Y
	T7iOfGlIYGABxjrGAEVVobIaRFeK5yzOg3/cFfbdqlo1+WlnsjWuY5rDYYzUg8spnwT7mL1n9h2
	8Lc7tnVp3jMD7KuJN3du54tcKUpciHLTpm7txwFJAPKwHZj6gkD9xmkBA8w8TvTsNoCGf04Gz4i
	s7UNsiMV9zTJuTp1zaPQdkvOfl1wHGsUoagaXr+g==
X-Gm-Gg: AY/fxX5r65EjKWp8du1u2wlbfbbCbHBgdV/SosLAqqzM5ub0J0JPKwHafHLLx4RqlZA
	NCImicbL3wG7sjzt9ks82FpsAM5/yQFB3YdtEB7Rb3d2hDjR3+nrgfRp57S/rJaRYhAf6clsr7A
	FO2SbyeDpe8OVE3rEDPrjRAUXJ1TJ84rgYxZc9H9JJafKT4v++a5uzQR/SlM3oBuYFTgw=
X-Received: by 2002:a05:7300:2d15:b0:2b0:50b1:d963 with SMTP id 5a478bee46e88-2b16f84c793mr2132334eec.3.1767694935365;
        Tue, 06 Jan 2026 02:22:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTU5GgPb7RyXzxRVO1D73BTRhhHRIIjcBHb20/ocM8LXLcoV5FaL5r6xKcep2wbjEheMq6XCPpQVkV5wA1hbc=
X-Received: by 2002:a05:7300:2d15:b0:2b0:50b1:d963 with SMTP id
 5a478bee46e88-2b16f84c793mr2132315eec.3.1767694934841; Tue, 06 Jan 2026
 02:22:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105084805.2155251-1-udipto.goswami@oss.qualcomm.com> <5f0e0401-fc0b-4ac7-ab95-7f85e6677b86@linux.intel.com>
In-Reply-To: <5f0e0401-fc0b-4ac7-ab95-7f85e6677b86@linux.intel.com>
From: Udipto Goswami <udipto.goswami@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 15:52:03 +0530
X-Gm-Features: AQt7F2q78M2OKHB_D_jeTqTD8udHQuX-AC0bGQSXB6EwTnzFRw2K8Mfa8nEK78Y
Message-ID: <CAMTwNXDFM=csMEJ1ZhiTOeQ-dDH4eu4ze9XRFbSj0d-4Fxsp=g@mail.gmail.com>
Subject: Re: [RFC PATCH] usb: xhci: Skip configure EP for disabled slots
 during teardown
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: m2NlUvBleixt7sJ8HQAlexTCeb170CiZ
X-Authority-Analysis: v=2.4 cv=fOw0HJae c=1 sm=1 tr=0 ts=695ce258 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=dVfV6pgAYcVQ6XmAGz0A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: m2NlUvBleixt7sJ8HQAlexTCeb170CiZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA4OCBTYWx0ZWRfX8tDH0hJNc2c/
 tQUxUAh7u2ALoYr4Gpi/SRp8m9s6BmmV5MnvOQMS80etRT1/CBGGEpIJ58o1WeFDqcY+AgCUwzH
 Bm0m+5WHz7XHG6hRRt0/yztQn5OA/h8xn8aLwCT2A0npJehLZv1sPSrYE5yGRuhaEl4cRJIcCjJ
 C8kpMDcnb70XX9sg1KLN/sNiRgMCYxYi7IDbmZnR6MX8/nU6S3WtpNvy8FIt37O64W9S0ujXxha
 mfZe2fQX4lJPWMf6LSgg8cSWIlHE+kYbC7YDKUI5gRZlmJWxfQwwXbWOLO209ZpBq0N27wCs5Dr
 8RS3vpSLUlOMGiiuiu1nvedI7f2hngdKtua+GXXMFlEqWixh/5HjvtVWDMB00ACF5wZN2fBag8W
 CxXWBewBkaav+t8GBbqG2Y6ouvVLngD0wmkAbP8w8ZDH+qjgn7tqEGv6nUPW+jgJJjvKYfcflHf
 dNx5B5SS2nPde1C4cJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060088

On Mon, Jan 5, 2026 at 4:32=E2=80=AFPM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> Hi
>
> On 1/5/26 10:48, Udipto Goswami wrote:
> > Consider a scenario when a HS headset fails resume and the hub performs
> > a logical disconnect, the USB core tears down endpoints and calls
> > hcd->check_bandwidth() on the way out, which with xHCI translates to a
> > drop-only Configure Endpoint command (add_flags =3D=3D SLOT_FLAG, drop_=
flags
> > !=3D 0). If the slot is already disabled (slot_id =3D=3D 0) or the virt=
ual
> > device has been freed, issuing this Configure Endpoint command is
> > pointless and may appear stuck until event handling catches up,
> > causing unnecessary delays during disconnect teardown.
> >
> > Fix this by adding a check in xhci_check_bandwidth(), return success
> > immediately if slot_id =3D=3D 0 or vdev is missing, preventing the
> > Configure Endpoint command from being queued at all. Additionally,
> > in xhci_configure_endpoint() for drop-only Configure Endpoint operation=
s,
> > return success early if slot_id =3D=3D 0 or vdev is already freed,
> > avoiding spurious command waits.
> >
> > Signed-off-by: Udipto Goswami <udipto.goswami@oss.qualcomm.com>
>
> Makes sense to prevent unnecessary 'configure endpoint' commands
>
> Could you share more details how we end up tearing down endpoints and
> calling xhci_check_bandwidth() after vdev is freed and slot_id set to zer=
o?
>
> Did the whole xHC controller fail to resume and was reinitialized in
> xhci_resume() power_lost path?
>
> Or is this related to audio offload and xhci sideband usage?
>
> If we end up in this situation in normal headset resume failure then ther=
e
> might be something else wrong.
>

Apologies! My mailbox was configured with HTML.
Re-sending in plain text.

Hi Mathias,

Yes, we are using offloaded audio in this case and xhci-sideband is involve=
d.

Scenario:
The headset is connected to the platform with no active playback, so
it suspends. No physical disconnect occurs.

1. Audio DSP sends a playback request while the USB headset (device
1-1) is suspended
2. Resume chain is triggered:
   handle_uaudio_stream_req
   =E2=86=92 enable_audio_stream
   =E2=86=92 snd_usb_autoresume
   =E2=86=92 dwc3-parent_wrapper (Qualcomm) =E2=86=92 xhci =E2=86=92 roothu=
b =E2=86=92 USB headset (1-1)
3. Resume fails at device 1-1:The headset fails to resume from
suspend. Note that the xHCI controller itself resumes
successfully=E2=80=94only the headset device fails.
4. Hub performs logical disconnect as a recovery mechanism
5. Race condition occurs: The USB core begins to teardown (calling
'check_bandwidth()'), but the xHCI driver may have already started
freeing the slot due to the failed resume.

Two parallel paths:
PATH1: (slower usb core teardown)

hub_port_connect_change()
=E2=94=94=E2=94=80 Device resume fails
   =E2=94=94=E2=94=80 hub_port_logical_disconnect()
      =E2=94=94=E2=94=80 usb_disconnect()
         =E2=94=94=E2=94=80 usb_disable_device()
            =E2=94=9C=E2=94=80 usb_disable_endpoint() [for each endpoint]
            =E2=94=82  =E2=94=94=E2=94=80 usb_hcd_disable_endpoint()
            =E2=94=94=E2=94=80 usb_hcd_alloc_bandwidth()
               =E2=94=94=E2=94=80 usb_hcd_check_bandwidth()
                  =E2=94=94=E2=94=80 xhci_check_bandwidth() =E2=86=90 POINT=
 OF FAILURE
                     =E2=94=94=E2=94=80 Tries to issue Configure Endpoint
                        =E2=94=94=E2=94=80 But slot_id =3D=3D 0 or virt_dev=
 =3D=3D NULL!

PATH2: (faster - xhci slot cleanup)
hub_port_logical_disconnect()
=E2=94=94=E2=94=80 usb_disconnect()
   =E2=94=94=E2=94=80 usb_release_dev()
      =E2=94=94=E2=94=80 usb_hcd_free_dev()
         =E2=94=94=E2=94=80 xhci_free_dev()
            =E2=94=94=E2=94=80 xhci_disable_slot()
               =E2=94=9C=E2=94=80 Issues TRB_DISABLE_SLOT command
               =E2=94=9C=E2=94=80 Waits for completion
               =E2=94=94=E2=94=80 xhci_free_virt_device()
                  =E2=94=9C=E2=94=80 Sets udev->slot_id =3D 0
                  =E2=94=9C=E2=94=80 Frees virt_dev
                  =E2=94=94=E2=94=80 Sets xhci->devs[slot_id] =3D NULL

RACE TIMELINE:

Path 2 (fast)
      Path 1 (slow)
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
T1: xhci_free_dev() starts
T2: xhci_disable_slot() issued
T3: slot_id =3D 0
T4: virt_dev freed
usb_disable_endpoint()
T5: xhci->devs[slot_id] =3D NULL                             (still process=
ing...)
T6:
     xhci_check_bandwidth() =E2=86=90 RACE!
T7:
     Tries Configure Endpoint
T8:
     But slot is already freed!

Path 1 is slower because it must iterate through all endpoints,
calling usb_disable_endpoint() for each one before reaching
check_bandwidth().
Path 2 completes faster with a single disable slot command. So if
T3-T5 has already executed, meaning tthe slot has already freed then
configure endpoint commands can be skipped i.e T6-T8.
Please let me know if this makes sense ?

Thanks,
-Udipto

