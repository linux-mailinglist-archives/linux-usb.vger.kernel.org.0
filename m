Return-Path: <linux-usb+bounces-26063-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F47B0CE1B
	for <lists+linux-usb@lfdr.de>; Tue, 22 Jul 2025 01:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C7CE17CFDF
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 23:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B3E2459F2;
	Mon, 21 Jul 2025 23:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7V1n3+v"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8171C07D9
	for <linux-usb@vger.kernel.org>; Mon, 21 Jul 2025 23:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753140372; cv=none; b=UudRCCYvSE7MyfIQMZCyXjT21PYoFCwDJBu30a5h5qOcvu9jIQ/yFAQa0BX3Eq/DtGz0IQUB+O8PtOHC+cRFvedNFQAWedE+FVF1bbZexQJ64rpUlKYaaD7FLWfjQgw9P2q6VVjLYy4AG7aTaeHuRpRUyEMGoL0YKmZbd41LC8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753140372; c=relaxed/simple;
	bh=CAf0YxBvFrJifmpHq8yfC9jlQKNcUfIMk5vvmtFhky8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NKubNLG080khDwXV6DVpDesNxgw8EtuefqIyYkCWpYKUo0Yj8EVyDM8jf49sph5+jfwXmpH9IYWmDHBd51vEcCx2KIiJNUzUGpAf/tuHuZOCthH4Qx4+E8mSv9zdKhLmHzHg86O22yWNy3uyinQdDOfOilH64WA6jAMxwXmiYc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7V1n3+v; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3dc9cc8453aso1069295ab.3
        for <linux-usb@vger.kernel.org>; Mon, 21 Jul 2025 16:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753140370; x=1753745170; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7newhkl3PVm47ieXHo1QxZYh22UwsQRKEsmZ8TgviA=;
        b=Y7V1n3+vXkRR3YQGg/pqsDNj7C8Ijmt/FGFaH1n6NAZ2LnnfQfgzDDSiogMpVHW37I
         z2ZYImS2ns5xBTswLzRQzvsGaDDA8CR5NZpBxhSaOeWgEVi6eBCqaGaBp0e/oc2lnUmf
         FKJkGLXbvkChX68y4jZhPX0nwATVxvOWJkg9N9ZK+tuJL5QdyiTY8tqgsobIjp1leQ3x
         9Sv54sNiwNQMAAk1fvAt1iKt5uKuRQVmywY4jgp8S6L8g0987svca3ls4SyLsY4i///h
         Q9PgbPOq6FCR5iB9pKouk4aNucIo8pXO45U56/0SM3P8me3CyT4NvDlrdKX+UW+wuDqL
         w1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753140370; x=1753745170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7newhkl3PVm47ieXHo1QxZYh22UwsQRKEsmZ8TgviA=;
        b=hnpSsZvHepPnobK8ufnfQnt6maiJVUCJQJHAuKaNoDQXRwXsLDv0wt9ea2RToT/5Qs
         +vELnd8BN1/m6Q9Fkllb6S/cBUbDa+bmn68M7oo98K04jig5dYUMiG8nmNDM0gr1zoCP
         okjlpCz19T1VKl6+eDhy3eEMtn44jEfp/QPfYDOAhIHONPPynpDQuov/bSpdLpkTRMt8
         oTP5ch3G1dQtoJqMxVgurVeU4S2CBQowA+dTDlgevbRiSRqW/nqGnsGPIhwHorlH8G8T
         s7LwomGrnMJbiwXt2wciIm9z4i3sAp6nUiWdeUSVWTfjJrPRlnCmB8PAkZojzABXH4tS
         TgPw==
X-Gm-Message-State: AOJu0YzBb7RMfxKa6xjZK0v9N7gHgnbhjgmLopBmvT2LWMHU50Mlctm7
	eFE1pNVordZ8bWrK8Lm7RWf5c7HBEGQpC90vL9nJ+HG3oGZs2iSXBl6IcyyHnR60A8Cc0i9i/Uq
	N6q5va9ZG6V+3oWTIlAkrgJ+9qhbM/9m5Z5QR
X-Gm-Gg: ASbGncvmQZ3L3NuLIYpgUtMzRkcG/LTuVmDv1ynHgoEAmhdw5wShkVfZqS3w+IMM6Jb
	TkssZPmeZoK3rTj2cGK6TPIXKFDMsJj+qcYz+Zc6nifJSItegqBgfnqupUgaddLTwC+5kUDzfmV
	7yXbWAXseTBB8SMsaNrnEWM4jxoww6QUPv3FqX2tTLs+3az9WCzo2VU+s7UtCPjCSJI4u26q6rh
	JBGpuRac8Gu8IhZlxHeQA==
X-Google-Smtp-Source: AGHT+IHQwYvq4FuYIpHpAXD1Y98G+x85MCIBBBV19i9CD84iiYNAqYxzVa/jOjEmDtrcNfdnlL0s0+xl/9jY5J6V3Do=
X-Received: by 2002:a92:cda6:0:b0:3e2:9d06:4b47 with SMTP id
 e9e14a558f8ab-3e29d064ceamr51685075ab.5.1753140369698; Mon, 21 Jul 2025
 16:26:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPCBteT7P9YGGETXf-Kw22g-3J_Pr8Nevt02CDPgpbb511D9GA@mail.gmail.com>
 <CAB0kiBLkaXCjhULJp2D2iSdnAnAmT2vYhAHJoQAc59pP0NgoCA@mail.gmail.com>
In-Reply-To: <CAB0kiBLkaXCjhULJp2D2iSdnAnAmT2vYhAHJoQAc59pP0NgoCA@mail.gmail.com>
From: Chris Wulff <crwulff@gmail.com>
Date: Mon, 21 Jul 2025 19:25:58 -0400
X-Gm-Features: Ac12FXxuTXQXTauXpruj6lTjXz_qn4v0tBrWEho4o4Cn0ZssYEJbEPMMzsFyCxo
Message-ID: <CAB0kiBKzsPzzY8u0YSeeNK6rCeycaFY5JqkswhJqBCGSBH=aOg@mail.gmail.com>
Subject: Re: Linux USB HID Gadget
To: Christian Brunschen <christian@brunschen.com>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> On Fri, Jun 6, 2025 at 12:31=E2=80=AFPM Christian Brunschen <christian@br=
unschen.com> wrote:
>
> Hi, and please accept my apologies if this is the wrong place to contact =
you, or if you're not the correct person to contact about this.
>

See comments inline. Sorry for taking so long to get back to you.

It is also good practice to CC the linux-usb mailing list so that
anyone else interested can
see the discussion. I've only been involved with HID with relation to
getting MS Teams
FEATURE reports working for our application.

> I was looking at the Linux USB HID Gadget code to which I believe you rec=
ently made some changes, specifically making it possible for userspace code=
 to respond to Get_Report requests?
>
> And I noticed a couple of things that appear to be open for improvement.
>
> For one thing, implementing the HID Get_Report request functionality, the=
 report ID is tracked, but the report type - Input, Output or Feature - see=
ms to be discarded. See for example this line in static int hidg_setup(...)=
,
>
>   hidg->get_report_req_report_id =3D value & 0xff;
>
> Referring to the Device Class Specification for HID 1.11, section 7.2.1 G=
et_Report Request, the wValue field of the request, used as value in the co=
de above, contains "Report Type and Report ID"; the Report Type being maske=
d off by the & 0xff part of the expression.
>

Yes, I can see how it could be useful to know if a GET_REPORT is for INPUT =
or
FEATURE. It didn't apply in my use case but it seems to be a perfectly
valid thing
to do according to the spec. Adding this information to the data
returned to userspace
seems like it would be useful.

> And there's nothing corresponding that I can find that stores or uses the=
 upper 8 bits of the value, i.e., the report type.
>
> In many cases, this won't matter much: a device might only ever send Inpu=
t reports through the Interrupt Out pipe, only accept Output reports via th=
e Interrupt Out pipe, and thus leave Get and Set Report operations on the C=
ontrol pipe for Feature reports (but see below).
>
> Or, if I am devising a device of my own, I can of course assign different=
 Report IDs to Input, Output and Feature reports.
>
> But not all real-world devices follow that pattern; indeed, the Host may =
poll for Input reports using Get_Report requests, as well as want to interr=
ogate Feature reports also using Get_Report requests - and those reports ma=
y share the same Report ID.
>
> So if I wanted to accurately emulate a device that uses the same Report I=
D for different kinds of reports, the current USB HID Gadget code makes tha=
t a little bit tricky.
>
> This brings me to the second thing.
>
> Currently starting on line 899, if the Interrupt Output endpoint is enabl=
ed, and a SET_REPORT request is received on the Control endpoint, on line 9=
03 the transfer is stalled:
>
>>  case ((USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_INTERFACE) << 8
>>      | HID_REQ_SET_REPORT):
>>   VDBG(cdev, "set_report | wLength=3D%d\n", ctrl->wLength);
>>   if (hidg->use_out_ep)
>>     goto stall;
>
>
> But the HID specification describes in section 6.2.2.5 Input, Output and =
Feature Items on page 32,
>
>> [,,,] Feature items make up Feature Reports accessible via the Control p=
ipe with the Get_Report (Feature) and Set_Report (Feature) requests.
>
>
> So whether or not the Interrupt Out pipe is being used to accept Set_Repo=
rt (Output) requests, the Control pipe should still always accept Set_Repor=
t (Feature) requests, and not stall those.
>
> So currently, when the Interrupt Out pipe is in use, all Set_Report reque=
sts on the Control pipe are rejected - thus making it impossible to handle =
Set_Report (Feature) requests; and if the Interrupt Out pipe is not in use,=
 all Set_Report requests are effectively treated as the Output reports to b=
e made available to read() by the client - including those that are Set_Rep=
ort (Feature) as opposed to Set_Report (Output) requests.


I believe you are correct. HID specification section 4.4 on page 10 describ=
es
OUTPUT reports are to be sent on the Out Endpoint when present, or the Cont=
rol
Endpoint when not using the Out Endpoint. This only talks about Output repo=
rts.
This should probably be changed to only stall Output reports when the
Out Endpoint
is in use.

>
> This is even more clear if we look at the Device Class Definition for PID=
 1.0 (for force feedback devices) which describes the typical arrangement o=
f pipes in its section 2. Functional Overview in this table,
>
>> Report TypeTransfer for a GET_REPORTTransfer for a SET_REPORT
>> InputHID Interrupt In pipeControl pipe
>> OutputControl pipeHID Interrupt Out pipe
>> FeatureControl pipeControl pipe
>
>
> where we can see that both Get_Report and Set_Report for Feature reports =
generally flow over the Control pipe.
>
> And for PID devices, Set_Report (Feature) and Get)Report (Feature) are us=
ed all over to request creation of effects, starting and stopping them, and=
 querying the status of the device.
>
> Do these things make sense - what have I missed?

The deficiencies you've highlighted seem to make sense to me anyway. Feel
free to submit a patch if these things are impeding you.

>
> Best wishes,
>
> // Christian Brunschen
>

Chris Wulff

