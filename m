Return-Path: <linux-usb+bounces-25448-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DD2AF74C7
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jul 2025 14:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 731BF561BD9
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jul 2025 12:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCAEC2E62D8;
	Thu,  3 Jul 2025 12:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inKYKE3m"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8191BD4F7
	for <linux-usb@vger.kernel.org>; Thu,  3 Jul 2025 12:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751547331; cv=none; b=Wllo73m5l1jtYdcRxC0hL5IdMglXuzuRjSE8VBiOAzdJkflHkF4eNaCPiisb31zOKk5G3X/U4N+6qt8rf53VIcUuU4/DRznrPqgo8DqxFGrUjCPjVKwRMv9OcGF+rfipKTeo6UhNSctWNOeFN58NE0qZ6CZCao9atEneGgOXtLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751547331; c=relaxed/simple;
	bh=6RgHhhADxt8Jml6stgpwROMZX+4Ewb6tPvv00ErZwFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iNd/Qlbl1z21VkeIe3osGe5udoO3le2o5nC6iFACruoZ92ErvaoMJEUuDM8Bngvi60pAs+HKe7jojHPZhTvx3UYnp6w4vqVuFSjRv41wE6Ro8qDgjoQIKSj8cb5Nb1YWeMT/uoQ/XH8hh93PmaBkz7jnTw+V4AzVltxZmY9B/Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inKYKE3m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5636neve007107
	for <linux-usb@vger.kernel.org>; Thu, 3 Jul 2025 12:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yM7ALEiCZpddq9s7Xi31+FqP
	3GYIHrucdW9r3a2Ywjo=; b=inKYKE3meADpHrjcLdNSVlKl7H5/atFV1b0sUbF1
	lGn1eeIVc63ChhA6ETAnTLv6VS7kZ2YpzK64Sogt/1hxkWkAQaa72E4qs02xQBXM
	HDfrF63ehSt0z88khlGl2KbpxxrLGomsfgjs+O7Gv/KhYbCT/X77+tkL7gVH2fXS
	HZs+4uVKwCroosKYgHl5Ir5i8aosLCWxooum2NNOW0RdEA9dlb+wlsWFm8XnpiA4
	kcx/wpVQDznLIUQHYJgcR/+yOdtCxE5IiBnf34VSuNu9rVKU2X+Bt7pRjlbw6UAD
	vmf073E0E0Z1u09G2/ZLfVTmHiKif0gfX8ZxojT66ufBHA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47napw2r8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 03 Jul 2025 12:55:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-311ef4fb5eeso871855a91.1
        for <linux-usb@vger.kernel.org>; Thu, 03 Jul 2025 05:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751547328; x=1752152128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yM7ALEiCZpddq9s7Xi31+FqP3GYIHrucdW9r3a2Ywjo=;
        b=B8GrTwUMr9jFU6m+q9uAeNea4KMcfrwmvNrntVcbQ2k+8auxiYQOsA2uCo5egKEn3x
         UAzffxWG6uAdhihHHzKnIQOrsR/e4FD7cvU44ChUonP4JcSfb9HbLjyX/hZ8OR+DG5EF
         HKx8MfQMlS6h1zwpMNdpBq+pCUL2CnR0YlwvLcAUA6518m70jknbfdv1hFZuUbSGtiAW
         MHAJgmbAEStPD32NGHAlOTpbsLkMZgtHxtB2Hwc9WJWfEClSjpkildU2LTHtin5JHsZl
         P3rwvfQv1gb62jsfiI5FxQGWqwSur6lkqkyLy5OEP2cnl+Jiva/qFIJ0aNWuGa2w5BV6
         Cb7g==
X-Forwarded-Encrypted: i=1; AJvYcCXsKYbzvpaHkJr1Mjh1Z3m8FDyOGiEd8Mf0PWuLD3xAiMlYuHIMvWzuhV6z+I/uVvmazcgqxJUvS2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIL5OmI+tkQ2pYzh7rB477MPniI9Q7oe69dLsqw8B7XICr/07Q
	oilEpGW+A65saY4FT0ag8NDgMDOMTnbz0dx4um6pnBHq4bqeRLUM5DQauVJFmKba1R3kGYmEQoy
	059N1DkH0tpZDXf5O+uqRpU6iFFENe0u3xIxjFdiKT4jn4vn8+1TnRnszICrgRGL/OPAgpfo41q
	UwY8hZZ87SlZX4gMj//I9rR1LPu6YkVDKj4D91Eg==
X-Gm-Gg: ASbGnctuYcWm6+1FNe93NajvR7wppjES4zAOWaezNxejhWPQSYdqRVBF0jZfkLQTfFT
	E5zq/UdkYJKnNdvbpYQa0VL+YjauT3I52zwAeaSPwaCv4J4oHCR7dxPcPAdGZoE4tQo22uZgyyr
	yp8w==
X-Received: by 2002:a17:90b:2d4d:b0:313:17d0:b066 with SMTP id 98e67ed59e1d1-31a9f4fa0b8mr2665015a91.7.1751547328205;
        Thu, 03 Jul 2025 05:55:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1+19WfOADdKPPLRdIfUyEbwxbuvIkJrHNyXOkhXgsfEb1vT/ckaV28DSBWimFLE/oPEqzlHCpdYJu5s8nsIA=
X-Received: by 2002:a17:90b:2d4d:b0:313:17d0:b066 with SMTP id
 98e67ed59e1d1-31a9f4fa0b8mr2664990a91.7.1751547327788; Thu, 03 Jul 2025
 05:55:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1751042810.git.pooja.katiyar@intel.com> <cc0b7701c4ea3d1001fefeb3df65caeb3e624722.1751042810.git.pooja.katiyar@intel.com>
 <2025062813-untying-hesitancy-088a@gregkh> <aGOgeSIOK-nDRGHB@kuha.fi.intel.com>
 <de4c73cc-2aaf-4987-a49c-dff2f38ba0f6@oss.qualcomm.com> <aGOy0qEUXQ7Rl3Cw@kuha.fi.intel.com>
 <45d5003d-87e1-4e8c-9eda-b1f67c7e57f5@oss.qualcomm.com> <aGPZwGekEihFjB-4@kuha.fi.intel.com>
 <BL3PR11MB6361636FCA9529F89B2691FBE743A@BL3PR11MB6361.namprd11.prod.outlook.com>
In-Reply-To: <BL3PR11MB6361636FCA9529F89B2691FBE743A@BL3PR11MB6361.namprd11.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 15:55:19 +0300
X-Gm-Features: Ac12FXyOMJMFBpWkxdkZsQipHi8hBK06A6ocZLT9vquXOBkZion6JxnTIyZovK4
Message-ID: <CAO9ioeXzcrWUWSVq0caYixVW4TSwoKB_NcM6-WevLea9mEno7Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] usb: typec: ucsi: Add support for message out data structure
To: "Katiyar, Pooja" <pooja.katiyar@intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=dIKmmPZb c=1 sm=1 tr=0 ts=68667dc1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=QyXUC8HyAAAA:8 a=UbAn9b-nVLu782tuJN0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEwOCBTYWx0ZWRfX1QgDPZa/+7xx
 a585sAMgAG3jgAlkQ4kVzwrV8kVWd7bJwBHpXie+nPlf39QjeuTUfsxaGtxW7b3SqXpEx3PoFj/
 7pzHZPjPqac0wrcqdNwXkAycjHUozOkipbqWxDu1ITU+ykclesQFa4mlZMtX54BWdeyPrS54MNh
 fxMRkzPXQ4LhzC8bZtY9ZEGBwWfyxhNCJEWJZVKzLqR8f7N/rMCgEWNVax11A5CwLLarM7HA8Vh
 qyd23ZuZxb3HA0um5u9aHCkW3g5lG9cvGxvRiBV6VrlHtGV0axPnONN1Uz+dvSKTu9RFU+jv4Gh
 weyFaYYUw8i9gc04r/5nnGThhZoox9GIipT7DVek1nD6kmL7MJ8Q6X/mGjOnc325gwcwtulG3GF
 dRsh16cPfxPvWosHhiOGEUTXXnSch53ooVob5fMr2rOpnryH1iNwtTKIrY1mYHbbimJOGkag
X-Proofpoint-GUID: gEsG3v8wa_A56Mpm31E8TnW0R60jfeB3
X-Proofpoint-ORIG-GUID: gEsG3v8wa_A56Mpm31E8TnW0R60jfeB3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030108

On Thu, 3 Jul 2025 at 07:29, Katiyar, Pooja <pooja.katiyar@intel.com> wrote:
>
> Hello Greg, Heikki and Dmitry,
>
> On Tue, Jul 1, 2025 05:51:12AM -0700 , Heikki Krogerus wrote:
> > On Tue, Jul 01, 2025 at 01:11:24PM +0300, Dmitry Baryshkov wrote:
> > > On 01/07/2025 13:05, Heikki Krogerus wrote:
> > > > On Tue, Jul 01, 2025 at 11:50:21AM +0300, Dmitry Baryshkov wrote:
> > > > > On 01/07/2025 11:46, Heikki Krogerus wrote:
> > > > > > Hi,
> > > > > >
> > > > > > On Sat, Jun 28, 2025 at 04:51:56PM +0200, Greg KH wrote:
> > > > > > > On Fri, Jun 27, 2025 at 11:10:10AM -0700, Pooja Katiyar wrote:
> > > > > > > > Add support for updating message out data structure for UCSI ACPI
> > > > > > > > interface for UCSI 2.1 and UCSI 3.0 commands such as Set PDOs and
> > > > > > > > LPM Firmware Update.
>
> ...
>
> > > > Okay. So how about a data structure for the entire mailbox that we can
> > > > pass to these functions?
> > > >
> > > > struct ucsi_mailbox {
> > > >          u32 cci;
> > > >          u64 control;
> > > >          void *message_in;
> > > >          size_t message_in_size;
> > > >          void *message_out;
> > > >          size_t message_out_size;
> > > > };
> > >
> > > What about a slightly different proposal (following ucsi_ccg design):
> > >
> > >
> > > struct ucsi {
> > >    // .....
> > >    u32 cci;
> > >    u8 message_in[UCSI_MAX_MESSAGE_IN];
> > >    u8 message_out[UCSI_MAX_MESSAGE_OUT];
> > > };
> > >
> > > The caller will fill ucsi->message_out, call sync_control with a proper
> > > length specified, then read UCSI_CCI_LENGTH(ucsi->cci) bytes from
> > > ucsi->message_in.
> >
> > Looks better indeed.
> >
> > > Note: I'm positive that we can handle message buffers in this way. I'm not
> > > so sure about the CCI, it might be too dynamic.
> >
> > Pooja, I'm sorry about the extra work needed. Can you check this?
> >
> > P.S. I'm already on vacation so there will be delays with my
> > responses.
> >
>
> Thank you for the feedback and suggestions.
>
> I can start working on the changes. Before diving into implementation,
> I would like to clarify a few points.
>
> 1. What is the preference with respect to the lengths of message in and message out,
> should the length be included as part of the ucsi structure or should be passed as
> separate parameters to relevant functions?

Store the lengths next to the buffer arrays.

>
> 2. As Dmitriy pointed out, cci changes might be too dynamic and hence we believe
> it's better to include message_in and message_out as part of the ucsi struct and
> exclude cci. What are your thoughts on this?
>
> 3. Implementing these changes will affect functions across different interfaces such as
> ACPI, ucsi_ccg, cros_ec_ucsi etc. At this time, we can only validate these changes on the
> ACPI interface. Unfortunately, we don't have the means to test other interfaces. What
> is your suggestion to proceed with implementation? should owners of other interfaces
> be involved for validation?

Change all the implementations at once and then collect Tested-by
tags, that's the usual procedure.

-- 
With best wishes
Dmitry

