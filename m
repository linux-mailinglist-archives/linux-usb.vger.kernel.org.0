Return-Path: <linux-usb+bounces-32898-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPlHM1PcemlE/AEAu9opvQ
	(envelope-from <linux-usb+bounces-32898-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 05:04:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34411AB985
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 05:04:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3E8A03008C83
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 04:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94253273D8D;
	Thu, 29 Jan 2026 04:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ctNmNQBt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B002C11EF
	for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 04:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769659451; cv=pass; b=PrwDdcTlgQ6gpUpwzcKH/0UdxMJqMTnZnNiEfSJY2gZMoevnG+Gj/4zMj1rpTZ2WU9GXi6tZq4FtaaZS3DD7EpsU7uRnf3T8uJBedV1QLbfAMvIvpKdyIPCdlH0lKFCqITRAHm3zj4alQRolWAQDpGxQ+sIRoz5e98BVSmHh+v8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769659451; c=relaxed/simple;
	bh=R75KpgPT2svi5yuefu1FJ+5zC76yTcT1WCQs9LHGTVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tovjra6jJQQHl5kO6vzZ+DLCcoUvOu7dRzydkmuC8lFta9o8shuY7S8gbn7QBbpx9GbLMQYyNQtz9gs0+V9BLB2NqNTnZQ0ObKmESOk5A0MtwUyiujMJFSY86KehU63OZDgA7lTUGcoU8beOnHOP3/g74ATY+h0EAFDVae+MFiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ctNmNQBt; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47a95a96d42so25145e9.1
        for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 20:04:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769659445; cv=none;
        d=google.com; s=arc-20240605;
        b=Xh9/dWyH9j1H9UuUoJiiWshmDmKIZyqNkVpWXXhGc4k4wwugpGlWkPHuEQzYTA2iyN
         C4tGe2NCSCAlZm66yqSrdtuOMDBKF2vB6uAOVVWnzLUrCgsPudU01cLVSED8FnakJlw1
         IaJaIEDjtyQA+BscPi+65+9TYGw+mM6O4w+OM48K1LsQOvawTojA05n4JZ/XUlHT0Zof
         xV0j/coPZKD4Fz3EEnOuKZkhGK+dbHzGiDIys47ymBWELN8F24ti27SdZK9JTxaNM4vx
         PPzIwFBXeakdX2tOP6adV8ljHylr5ucUPsE9GCzJzi3T1ovTLfAt2/vW7Ie0StfEL740
         qSfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WsGxxEybDOlow6ycYq74FgbGsjTuD8K6q1LcRz+02HA=;
        fh=srCnbwOC6G8SBFrC8C1aorU71olOL57MuOD5k4JT1uk=;
        b=fYjGWIA0qthNdH7IXfSiVlAREHMThzbg6eX3LSLfl5rx8ji6aqsTcX4gCAZdOBNQNa
         5l9d68m2jYfuXJMLzjMh5h90Jg+daTf5OCZgjp0taz7R/Icl8m6GQD+0zfsOVfm/CFSl
         2bU5ZJDUIA08Y/wljEL3I5OE42W7W9gCeA4T4StRRWQpM0Dl8y3IiNaAVxGLWbvwNGuf
         C90t5jxZZb4AdE/yTihy2t9LvWrA6Y0Xaxs88OTQtJEeh8RW2gxwex6+jU2hlnIRedxx
         iI//Md+y0lwYPz2+Segg0WccQtz3vRkhy4sBqqEpFer0nAUtzUiUvebnfbW2c9ymncsy
         WtAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769659445; x=1770264245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WsGxxEybDOlow6ycYq74FgbGsjTuD8K6q1LcRz+02HA=;
        b=ctNmNQBtWy9KKfcxoPvLDwiNVYN9tKcjwxH9YJ7DYl5xzeKWAXD/bJb+NMlEi9t6eo
         oOVO8ZO6N5IvdQeqxuQxe13cgGluZ2HUEEU0qT7EJwGVWPThNOxfLCdr/lsSW4EZ2A4p
         uYgHrrGcZQOIj52Y+FntgFi0j+rNjMYsXHWqPw6jNlA/wAjvcIRLHQ/C0XOTqE1NpBgX
         tc3MWAcl7dPXaaoqz0azU5dbZh2ZmqjBmwbITeDjc2+a6k/hY5MJ3vhNB6kQhyyB6frJ
         RM/dBPQFsRpmiMKa2b+NbwUIb+jFJcMp5mdLkVk42Z2Yfio970Fav6bWXjl7gw5+gA7S
         mMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769659445; x=1770264245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WsGxxEybDOlow6ycYq74FgbGsjTuD8K6q1LcRz+02HA=;
        b=CFrLEegipOC+8vN3z0tGiBYxv89BTsYLlgqz42d4zccVJCkRcaEWJZr8cnmzwnenTp
         LLInFX9gOJVIvHXmaaOcqxWnJ4mKia/NTqd3+DpVzSbaykr9vH5HhNHorE/4zGykGQbZ
         NSuduEggtLQImAlQtWwABuTZYUp/X+4BfGzKEWpcCqydabqzTxfDi5pqfZGG9w49X08k
         f7eLHF5c2tNWiZm5m3COx7Tz41v/RmDQGQC9dZKWYn7HRvo4Kt5U7oRJnvoyOsR21N3G
         2LDbRpJqcwpJhcC3gP7PiKMG2m6AQoqKZNaelqYn08gz/8FUD+JK09PmGk/uhAG8mS8S
         e4/w==
X-Forwarded-Encrypted: i=1; AJvYcCXhG+8m+zZ5HqLA5rGOBFyVOcEWHrhJQrUOv2HdniYB3QItb8+HoP9TxK6kGXNXs+0eHINrBHLnTz8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl4fFQJ6BIzzHUqJN5rJXctwN4VBRRurFpLgJru4FX7OjIu5/9
	dImaMFPICgomDeJudKO/8mYLLVInFws/C8V7t4WorAnKob0EsACsHtf4dUjx6po5RuPZXsNvoJC
	QggL7tduw/PMTK2l99wx6qPDuYXZmLROCwRDm9Ppp
X-Gm-Gg: AZuq6aJYOi8uaUa3Z+JQLm4C2iMzzgo3hN2pHEaU7h1OiBhqF9rDDtX1tJoP/kJLPH5
	cq9OKxdni+t0IrBmn8TyPa4pqxqecntJsjzmFQnH4JM8wvhPtj302ugAjHwBw9JIv9Xf6w+k4x9
	gcq2uoosTyQJ8BxxahtYNtMz7PrP4Knk6LOutoys9c8pYt8NfhA54jRKhAcvVucjmKzK68o6HOV
	OLVRetiiLLPeewOhQd06j2GA1BKFyk4/BXieZRw3V8teCifoJjOdVYUiXBxVa9jfbdXwLpaVoQr
	V7JZ3w==
X-Received: by 2002:a05:600c:1c26:b0:477:95a8:3805 with SMTP id
 5b1f17b1804b1-48189bf495dmr392125e9.15.1769659445200; Wed, 28 Jan 2026
 20:04:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <GV2PR06MB10809D32F05C864813CC36C10D791A@GV2PR06MB10809.eurprd06.prod.outlook.com>
In-Reply-To: <GV2PR06MB10809D32F05C864813CC36C10D791A@GV2PR06MB10809.eurprd06.prod.outlook.com>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Thu, 29 Jan 2026 12:03:38 +0800
X-Gm-Features: AZwV_Qgm9__lyxyDkWAmCn2zZ0JItY11Ta114jsH5fJxqtefa-FOpMSHt0Lx7Pk
Message-ID: <CAKzKK0qdNaHSR8Kr7tvXbt8rK4J89iy_6ZDv8M3w_Uz+668c6w@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: f_ncm: Fix Kernel Panic due to access of
 invalid gadget ptr
To: LI Qingwu <qing-wu.li@leica-geosystems.com.cn>
Cc: "hgajjar@de.adit-jv.com" <hgajjar@de.adit-jv.com>, 
	"eugeniu.rosca@bosch.com" <eugeniu.rosca@bosch.com>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "guofeng.li@gm.com" <guofeng.li@gm.com>, 
	"hardik.gajjar@bosch.com" <hardik.gajjar@bosch.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "maze@google.com" <maze@google.com>, 
	"quic_kriskura@quicinc.com" <quic_kriskura@quicinc.com>, 
	"quic_linyyuan@quicinc.com" <quic_linyyuan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32898-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khtsai@google.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: 34411AB985
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 6:49=E2=80=AFPM LI Qingwu
<qing-wu.li@leica-geosystems.com.cn> wrote:
>
> > On Mon, Mar 11, 2024 at 01:04:18PM +0100, Hardik Gajjar wrote:
> > > On Fri, Mar 08, 2024 at 05:47:37PM +0530, Krishna Kurapati PSSNV wrot=
e:
> > > >
> > > >
> > > > On 3/8/2024 5:25 PM, Hardik Gajjar wrote:
> > > > > On Thu, Mar 07, 2024 at 11:12:07PM +0530, Krishna Kurapati PSSNV =
wrote:
> > > > > >
> > > >
> > > > [...]
> > > >
> > > > >
> > > > > I believe using gether_cleanup altogether may not be an optimal s=
olution.
> > > > > The creation and deletion of network interfaces should align with=
 the behavior of each specific network driver.
> > > > >
> > > > > For instance, in the case of NCM, the usb0 interface is created u=
pon the creation of a directory
> > > > > in config/usb_gadget/gX/functions/ncm.usb0, and it is removed whe=
n the corresponding directory
> > > > > is deleted. This follows a standard flow observed in many network=
 drivers, where interfaces are
> > > > > created during driver loading/probing and deleted during removal.
> > > > >
> > > >
> > > > Hi Hardik,
> > > >
> > > >  Yeah. I observed this behavior.
> > > >
> > > > > Typically, deleting the gadget on every disconnection is not cons=
idered a good practice, as it can
> > > > > negatively impact the user experience when accessing the gadget.
> > > > >
> > > >
> > > > Got it. I was suspecting issues might come up during fast Plug-In/ =
Plug-Out
> > > > cases as setting and cleanup of network interface might take some t=
ime.
> > > >
> > > > > In our specific scenario, retaining the usb0 network interface ha=
s proven to enhance performance
> > > > > and stabilize connections. Previous attempts to remove it resulte=
d in an observed increase in time of 300ms,
> > > > > particularly at the start of Apple CarPlay sessions.
> > > > >
> > > >
> > > > Thanks for this info. Makes sense to keep it in free_inst only. But=
 my
> > > > initial doubt only stemmed from the fact that actions taken during =
bind must
> > > > be reversed during unbind.
> > > >
> > > > > Furthermore, it's important to highlight that in Qualcomm product=
s and msm kernels, the inclusion of gether_cleanup
> > > > > in the unbind process was eventually reverted. While the specific=
 reason for reverting the patch is unknown,
> > > > > it suggests that the addition may not have yielded the intended o=
r required results
> > > > >
> > > > > Following is the revert patch details in msm-5.4 kernel, if you w=
ant check it.
> > > > >
> > > > > Revert "usb: gadget: f_ncm: allocate/free net device upon driver =
bind/unbind"
> > > > >
> > > > > This reverts commit 006d8adf555a8c6d34113f564ade312d68abd3b3.
> > > > >
> > > > > Move back the allocation of netdevice to alloc_inst(), one-time
> > > > > registration to bind(), deregistration and free to rm_inst(). The
> > > > > UI update issue will be taken up with proper stakeholders.
> > > > >
> > > > > Change-Id: I56448b08f6796a43ec5b0dfe0dd2d42cdc0eec14
> > > > >
> > > >
> > > > Agree. This was merged first in 4.19 downstream (most probably for =
car play
> > > > use case only) and then reverted in 5.4. But present 4.19 code in Q=
C still
> > > > keeps it in unbind path. The only reason I suspect it was reverted =
was to
> > > > get back on to same page with upstream driver (atleast starting fro=
m 5.10,
> > > > this was the reasoning to remove gether_cleanup in unbind path and =
put it
> > > > back in free_inst).
> > > >
> > > > Thanks,
> > > > Krishna,
> > >
> > > Thanks Krinshna for your comment
> > > Come to the first comment from Greg.
> > >
> > > > What commit id does this fix?
> > > >
> > > > thanks,
> > > >
> > > > greg k-h
> > >
> > > >Hi Greg,
> > >
> > > >The network device parent is not being properly cleaned up during un=
bind since the \
> > > >initial commit of the driver. In that case, should I mention the Fir=
st commit ID of \
> > > >the driver as broken commit or would you advice to say, For example =
"Clean up netdev \
> > > >parent in unbind".
> > >
> > > >Thanks,
> > > >Hardik
> > >
> > > @Greg,
> > >
> > > Can you please provide guidance on how to proceed? Should I update th=
e commit message to exclude the term 'Fix' in the title?
> > >
> > > Thanks,
> > > Hardik
> >
> > Hi Greg,
> >
> > Should we move forward if there are no further comments?
> >
> > Thanks,
> > Hardik
>
>
> Hi Hardik and all,
>
> Gentle ping on this patch. I wanted to follow up on the status and see if
> there have been any updates or alternative fixes applied.
>
> I have recently tested this patch on NXP iMX8MP platforms and can confirm=
 it
> successfully resolves the use-after-free panic issue.
>
> Best Regards
> Li Qingwu

Hi Qingwu,

I recently submitted a patchset to address the lifetime mismatch
between the network device and its parent gadget device for the NCM
driver [1].

Could you please verify if this series resolves the problem for you?

[1] https://lore.kernel.org/all/20251230-ncm-refactor-v1-0-793e347bc7a7@goo=
gle.com/

Regards,
Kuen-Han

