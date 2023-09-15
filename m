Return-Path: <linux-usb+bounces-106-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF187A13B7
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 04:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A27F1281A5B
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 02:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1EA01FCF;
	Fri, 15 Sep 2023 02:16:48 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CE8ED3
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 02:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27488C4AF5C;
	Fri, 15 Sep 2023 02:16:45 +0000 (UTC)
Date: Thu, 14 Sep 2023 22:16:44 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linyu Yuan <quic_linyyuan@quicinc.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Bin Liu <b-liu@ti.com>, Peter Chen
 <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, Roger Quadros
 <rogerq@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Masami
 Hiramatsu <mhiramat@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/8] usb: udc: trace: reduce buffer usage of trace event
Message-ID: <20230914221644.6f4517b3@rorschach.local.home>
In-Reply-To: <dc54b48f-f2ad-9948-f50f-a6f2c004c77c@quicinc.com>
References: <20230914100302.30274-1-quic_linyyuan@quicinc.com>
	<20230914100302.30274-4-quic_linyyuan@quicinc.com>
	<20230914125410.432ca343@gandalf.local.home>
	<dc54b48f-f2ad-9948-f50f-a6f2c004c77c@quicinc.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 15 Sep 2023 09:11:06 +0800
Linyu Yuan <quic_linyyuan@quicinc.com> wrote:

> >> +		snprintf(__s, 9, "ep%d%s", te.address, \
> >> +			(te.caps.dir_in && te.caps.dir_out) ? "" : \
> >> +			te.caps.dir_in ? "in" : "out"); =20
> > Note, there's a temp buffer trace_seq 'p' available for use as well. See
> > both include/trace/events/libata.h and include/trace/events/scsi.h:
> >
> >    const char *libata_trace_parse_status(struct trace_seq*, unsigned ch=
ar);
> >    #define __parse_status(s) libata_trace_parse_status(p, s)
> >
> > I think that can be used instead of adding this TP_printk_init(). =20
>=20
>=20
> the reason add TP_printk_init() because when i first design some macro=20
> which not
>=20
> related to tracepoint,=C2=A0 it use too much stack.
>=20

Not sure what you mean about 'uses too much stack'. This is called by
the reading code and not some arbitrary location, and the above macros
are done in the same location as your "init" call, so I'm not sure how
that makes a difference on the stack.

>=20
> but i think=C2=A0 TP_printk_init()=C2=A0 is good as it following most com=
mon way=20
> to print.
>=20

I really do not want to add more versions of TRACE_EVENT() that I need
to maintain unless there is a really good reason to do so.

And I really don't want to encourage the use of a "TP_printk_init()"
because that just encourages more use cases that will make it hard for
user space to parse the TP_printk().

-- Steve

