Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1B6A4BF16
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2019 18:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfFSQ4A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jun 2019 12:56:00 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:33880 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726091AbfFSQ4A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Jun 2019 12:56:00 -0400
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com [10.13.135.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BBD8FC0198;
        Wed, 19 Jun 2019 16:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1560963359; bh=HO+rn+QSjMq4ZGNyPfS45aVNO4aF2lCIhNPXZRANsu4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=lsPMZ29r1taQWUgBvHfkMmlNfDQCbBsqkqZ+y7b0/N733t5MdLqtNigV5sV9wjJwb
         /F0P3Wcf2y2n8oTfUtPaUFyrtxSkeaOsGoJG53JUzMQa18coNAa6Mp+bFTDeHXWWiz
         9aspmZ1X2WE72kuYtEbVN6fF5WGH9xteTusebgIxGfKZpcG5U86nwKnHntpTzyr7HJ
         w7VKTSSffKYj5WmPIA6Vyc/hC7Z00cLNM+AbCDrVACTld8sOZMD8yThJdx0fudiF38
         +mhpYwWaRrGvrV5XYEFq2ezU3DOBYSWCqmYQtJXkXrGeE0FAqkUWRWx7/9oNFNLAYF
         y8GXIwGoj6eag==
Received: from US01WXQAHTC1.internal.synopsys.com (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 9A1D3A005D;
        Wed, 19 Jun 2019 16:55:55 +0000 (UTC)
Received: from us01wembx1.internal.synopsys.com ([169.254.1.22]) by
 US01WXQAHTC1.internal.synopsys.com ([::1]) with mapi id 14.03.0415.000; Wed,
 19 Jun 2019 09:55:28 -0700
From:   John Youn <John.Youn@synopsys.com>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "John Youn" <John.Youn@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [RFC] Sorting out dwc3 ISOC endpoints once and for all
Thread-Topic: [RFC] Sorting out dwc3 ISOC endpoints once and for all
Thread-Index: AQHVHRZktHmVHA84kESiBGd9iNhFnKajC5cAgAA0sBA=
Date:   Wed, 19 Jun 2019 16:55:27 +0000
Message-ID: <2B3535C5ECE8B5419E3ECBE30077290902E78B1310@us01wembx1.internal.synopsys.com>
References: <87a7etd8s7.fsf@linux.intel.com>
 <2B3535C5ECE8B5419E3ECBE30077290902E78AF3D7@us01wembx1.internal.synopsys.com>
 <30102591E157244384E984126FC3CB4F63A11B8A@us01wembx1.internal.synopsys.com>
 <87fto7gy1o.fsf@linux.intel.com>
 <30102591E157244384E984126FC3CB4F63A1230F@us01wembx1.internal.synopsys.com>
 <87a7eef5rl.fsf@linux.intel.com>
In-Reply-To: <87a7eef5rl.fsf@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcam9obnlvdW5c?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy0wOWIxNjJmZi05MmIzLTExZTktODk4My1iODA4?=
 =?us-ascii?Q?Y2Y0NTI0ZTJcYW1lLXRlc3RcMDliMTYzMDAtOTJiMy0xMWU5LTg5ODMtYjgw?=
 =?us-ascii?Q?OGNmNDUyNGUyYm9keS50eHQiIHN6PSI1NjIxIiB0PSIxMzIwNTQzNjkyODM3?=
 =?us-ascii?Q?NDM3MzciIGg9IlBFWE92cmR5YVRoUkN1MC8vOXMxVUw2V2oyMD0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUJRSkFB?=
 =?us-ascii?Q?RDVIekxNdnliVkFiV0dWMkxZcXBZOHRZWlhZdGlxbGp3T0FBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQUNrQ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBNUN3ZzVRQUFBQUFBQUFBQUFBQUFBSjRBQUFCbUFHa0Fi?=
 =?us-ascii?Q?Z0JoQUc0QVl3QmxBRjhBY0FCc0FHRUFiZ0J1QUdrQWJnQm5BRjhBZHdCaEFI?=
 =?us-ascii?Q?UUFaUUJ5QUcwQVlRQnlBR3NBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR1lBYndCMUFHNEFaQUJ5QUhrQVh3?=
 =?us-ascii?Q?QndBR0VBY2dCMEFHNEFaUUJ5QUhNQVh3Qm5BR1lBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FB?=
 =?us-ascii?Q?QUFBQUNlQUFBQVpnQnZBSFVBYmdCa0FISUFlUUJmQUhBQVlRQnlBSFFBYmdC?=
 =?us-ascii?Q?bEFISUFjd0JmQUhNQVlRQnRBSE1BZFFCdUFHY0FYd0JqQUc4QWJnQm1BQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJtQUc4?=
 =?us-ascii?Q?QWRRQnVBR1FBY2dCNUFGOEFjQUJoQUhJQWRBQnVBR1VBY2dCekFGOEFjd0Jo?=
 =?us-ascii?Q?QUcwQWN3QjFBRzRBWndCZkFISUFaUUJ6QUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHWUFid0IxQUc0QVpBQnlBSGtB?=
 =?us-ascii?Q?WHdCd0FHRUFjZ0IwQUc0QVpRQnlBSE1BWHdCekFHMEFhUUJqQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFD?=
 =?us-ascii?Q?QUFBQUFBQ2VBQUFBWmdCdkFIVUFiZ0JrQUhJQWVRQmZBSEFBWVFCeUFIUUFi?=
 =?us-ascii?Q?Z0JsQUhJQWN3QmZBSE1BZEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQm1B?=
 =?us-ascii?Q?RzhBZFFCdUFHUUFjZ0I1QUY4QWNBQmhBSElBZEFCdUFHVUFjZ0J6QUY4QWRB?=
 =?us-ascii?Q?QnpBRzBBWXdBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdZQWJ3QjFBRzRBWkFCeUFI?=
 =?us-ascii?Q?a0FYd0J3QUdFQWNnQjBBRzRBWlFCeUFITUFYd0IxQUcwQVl3QUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFB?=
 =?us-ascii?Q?QUNBQUFBQUFDZUFBQUFad0IwQUhNQVh3QndBSElBYndCa0FIVUFZd0IwQUY4?=
 =?us-ascii?Q?QWRBQnlBR0VBYVFCdUFHa0FiZ0JuQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFC?=
 =?us-ascii?Q?ekFHRUFiQUJsQUhNQVh3QmhBR01BWXdCdkFIVUFiZ0IwQUY4QWNBQnNBR0VB?=
 =?us-ascii?Q?YmdBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBSE1BWVFCc0FHVUFjd0Jm?=
 =?us-ascii?Q?QUhFQWRRQnZBSFFBWlFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFB?=
 =?us-ascii?Q?QUFBQ0FBQUFBQUNlQUFBQWN3QnVBSEFBY3dCZkFHd0FhUUJqQUdVQWJnQnpB?=
 =?us-ascii?Q?R1VBWHdCMEFHVUFjZ0J0QUY4QU1RQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFB?=
 =?us-ascii?Q?QUJ6QUc0QWNBQnpBRjhBYkFCcEFHTUFaUUJ1QUhNQVpRQmZBSFFBWlFCeUFH?=
 =?us-ascii?Q?MEFYd0J6QUhRQWRRQmtBR1VBYmdCMEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFIWUFad0JmQUdzQVpR?=
 =?us-ascii?Q?QjVBSGNBYndCeUFHUUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFB?=
 =?us-ascii?Q?QUFBQUFDQUFBQUFBQT0iLz48L21ldGE+?=
x-dg-rorf: true
x-originating-ip: [10.13.184.19]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: linux-usb-owner@vger.kernel.org <linux-usb-owner@vger.kernel.org> O=
n
> Behalf Of Felipe Balbi
> Sent: Tuesday, June 18, 2019 11:29 PM
> To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>; Thinh Nguyen
> <Thinh.Nguyen@synopsys.com>; John Youn <John.Youn@synopsys.com>
> Cc: linux-usb@vger.kernel.org
> Subject: Re: [RFC] Sorting out dwc3 ISOC endpoints once and for all
>=20
>=20
> Hi,
>=20
> Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> >>>>> Would there be any obvious draw-back to going down this route? The
> thing
> >>>>> is that, as it is, it seems like we will *always* have some corner =
case
> >>>>> where we can't guarantee that we can even start a transfer since th=
ere's
> >>>>> no upper-bound between XferNotReady and gadget driver finally
> queueing a
> >>>>> request. Also, I can't simply read DSTS for the frame number becaus=
e of
> >>>>> top-most 2 bits.
> >>>>>
> >>>> For non-affected version of the IP, the xfernotready -> starttransfe=
r
> >>>> time will have to be off by more than a couple seconds for the drive=
r
> >>>> to produce an incorrect 16-bit frame number. If you're seeing errors
> >>>> here, maybe we just need to code review the relevant sections to mak=
e
> >>>> sure the 14/16-bit and rollover conditions are all handled correctly=
.
> >>> I think what Felipe may see is some delay in the system that causes t=
he
> >>> SW to not handle XferNotReady event in time. We already have the "ret=
ry"
> >>> method handle that to a certain extend.
> >>>
> >>>> But I can't think of any obvious drawbacks of the quirk, other than
> >>>> doing some unnecessary work, which shouldn't produce any bad
> >>>> side-effects. But we haven't really tested that.
> >>>>
> >>> The workaround for the isoc_quirk requires 2 tries sending
> >>> START_TRANSFER command. This means that you have to account the
> delay of
> >>> that command completion plus potentially 1 more END_TRANSFER
> completion.
> >>> That's why the quirk gives a buffer of at least 4 uframes of the
> >>> scheduled isoc frame. So, it cannot schedule immediately on the next
> >>> uframe, that's one of the drawbacks.
> >>>
> >>>
> >>> Hi Felipe,
> >>>
> >>> Since you're asking this, it means you're still seeing issue with you=
r
> >>> setup despite retrying to send START_TRANSFER command 5 times. What's
> >>> the worse delay responding to XferNotReady you're seeing in your setu=
p?
> >> There's no upper-bound on how long the gadget will take to enqueue a
> >> request. We see problems with UVC gadget all the time. It can take a l=
ot
> >> of time to decide to enqueue data.
> >
> > That's why there's a mechanism in the controller to return bus-expiry
> > status to let the SW know if it had scheduled isoc too late. SW can do =
2
> > things: 1) re-schedule at a later timer or 2) send END_TRANSFER command
> > to wait for the next XferNotReady to try again.
>=20
> All of this is still rather flakey. Can I send consecutive END_TRANSFER
> commands and get new XferNotReady at any moment? Consider this
> situation:
>=20
> . transfer started
> . transfer completes with status Missed ISOC
> . driver issues END_TRANSFER (as required by docs)
> . XferNotReady fires
> . driver updates current frame number
> . several mS of nothing
> . finally gadget enqueues a transfer
> . Start Transfer command
> . completes with Bus Expiry
>=20
> Can I issue *another* END_TRANSFER at this point? I don't even have a
> valid transfer resource since transfer wasn't started.
>=20
> The best "workaround" I can think of would be to delay END_TRASFER until
> ep_queue time.
>=20
> >> Usually I hear this from folks using UVC gadget with a real sensor on
> >> the background.
> >>
> >> I've seen gadget enqueueing as far as 20 intervals in the future. But
> >> remember, there's no upper-bound. And that's the problem. If we could
> >> just read the frame number from DSTS and use that, we wouldn't have an=
y
> >> issues. But since DSTS only contains 14 our of the 16 bits the
> >> controller needs, then we can't really use that.
> >
> > You can create another quirk for devices that have this behavior to use
> > frame number in DSTS instead.  As John had pointed out and mentioned,
> > this will only work if the service interval and the delay in the
> > scheduling of isoc is within 2 seconds.
>=20
> well, that's better than nothing, but there's no upper-bound for the
> gadget driver, really.
>=20

This will take care of the scenario you described above. Using xfernotready=
+DSTS to calculate the start transfer frame number should probably just be =
the default behavior.

For the case the gadget driver takes > 2 seconds to queue, you can go throu=
gh the quirk. It's probably best to do this pre-emptively rather than rely =
on bus expiry. Because bus expiry only happens when your start frame is off=
 by > 2 seconds. So you may get the top-2 bits wrong and start transfer wil=
l succeed, but you will have introduced a delay in the stream.

> They are *not* internal if SW needs to know that to start a transfer
> properly it needs these extra two bits :-) What I meant to say was that
> we should never have a 16-bit frame number. Only 14 bits. But in any
> case, we can't change the HW now :-)

I believe the bits were added to allow for scheduling of large intervals, l=
ike 2 and 4 seconds. If anything DSTS should reveal the 16-bit frame number=
 as well.

We can ask our hw engineers if they have any other suggestions for this cas=
e.

John


