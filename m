Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5581949191
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2019 22:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728179AbfFQUo3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jun 2019 16:44:29 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:46498 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725844AbfFQUo1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jun 2019 16:44:27 -0400
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com [10.12.135.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3EC49C0177;
        Mon, 17 Jun 2019 20:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1560804266; bh=Z26A9AeWeq8semmY0vPEZdQnEOmw8I1LdI7mugqYN94=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=KRunLwNNlCJqEjw1BibK1DZgvPi2MrRo4NXerluhY2ZLNeSJ4Qm+Qj8tldsmsMHeS
         Gn/1iEeuNMWOgiu3Du/8KKoEih69NbNbAlOtHFtgVCOMjCmPPG37kTm85XlS6kVKMI
         zqpXxuR7AOxDebdUNXbNYwxMka2DiHGqeiszIo1qhQzZ/W1Dpk60yeD9Nnf9lxQMVF
         InScHWGX0LEN/id7ex1oak/3q9OjdF80YxiqLbFQtHrVt9fk3f0UMWOdIz8GqU+55e
         7iAVOIloi3MOdRb+kBYZgQwf2tuGl8YzdU1vE2bnC/PE0AyI0tlVIwmh1nx4rFVoB0
         T4ntqBLnTDKkA==
Received: from US01WEHTC2.internal.synopsys.com (us01wehtc2.internal.synopsys.com [10.12.239.237])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 2557FA009A;
        Mon, 17 Jun 2019 20:44:25 +0000 (UTC)
Received: from us01wembx1.internal.synopsys.com ([169.254.1.22]) by
 US01WEHTC2.internal.synopsys.com ([10.12.239.237]) with mapi id
 14.03.0415.000; Mon, 17 Jun 2019 13:44:25 -0700
From:   John Youn <John.Youn@synopsys.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        John Youn <John.Youn@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [RFC] Sorting out dwc3 ISOC endpoints once and for all
Thread-Topic: [RFC] Sorting out dwc3 ISOC endpoints once and for all
Thread-Index: AQHVHRZktHmVHA84kESiBGd9iNhFnKagVGJA
Date:   Mon, 17 Jun 2019 20:44:25 +0000
Message-ID: <2B3535C5ECE8B5419E3ECBE30077290902E78AF618@us01wembx1.internal.synopsys.com>
References: <87a7etd8s7.fsf@linux.intel.com>
 <2B3535C5ECE8B5419E3ECBE30077290902E78AF3D7@us01wembx1.internal.synopsys.com>
 <30102591E157244384E984126FC3CB4F63A11B8A@us01wembx1.internal.synopsys.com>
In-Reply-To: <30102591E157244384E984126FC3CB4F63A11B8A@us01wembx1.internal.synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcam9obnlvdW5c?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy1hZmUzNzY4ZS05MTQwLTExZTktODk4Mi1iODA4?=
 =?us-ascii?Q?Y2Y0NTI0ZTJcYW1lLXRlc3RcYWZlMzc2OGYtOTE0MC0xMWU5LTg5ODItYjgw?=
 =?us-ascii?Q?OGNmNDUyNGUyYm9keS50eHQiIHN6PSI1NTI0IiB0PSIxMzIwNTI3Nzg2Mzk0?=
 =?us-ascii?Q?ODc3MDYiIGg9InpLUDZ5RDVyQ2M0UW5CMDZNTzFkdytrY011cz0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUJRSkFB?=
 =?us-ascii?Q?RGE4bWh5VFNYVkFkUDZ1RE5FSmlxTjAvcTRNMFFtS28wT0FBQUFBQUFBQUFB?=
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
> From: Thinh Nguyen
> Sent: Monday, June 17, 2019 12:09 PM
> To: John Youn <johnyoun@synopsys.com>; Felipe Balbi
> <felipe.balbi@linux.intel.com>; John Youn <John.Youn@synopsys.com>
> Cc: linux-usb@vger.kernel.org
> Subject: Re: [RFC] Sorting out dwc3 ISOC endpoints once and for all
>=20
> Hi,
>=20
> John Youn wrote:
> >> -----Original Message-----
> >> From: Felipe Balbi <felipe.balbi@linux.intel.com>
> >> Sent: Friday, June 7, 2019 2:50 AM
> >> To: John Youn <John.Youn@synopsys.com>
> >> Cc: linux-usb@vger.kernel.org
> >> Subject: [RFC] Sorting out dwc3 ISOC endpoints once and for all
> >>
> > ++ Thinh
> >
> > Hi Felipe,
> >
> > Sorry, missed this e-mail.
> >
> >> Now that we have dwc3_gadget_start_isoc_quirk() which figures out the
> >> correct combination for the top-most 2 bits in the frame number, why
> >> don't we just use that to start isochronous transfers and never, again=
,
> >> have Bus Expiry problems?
> > We should only see expiry problems on the affected versions with incorr=
ect
> top-2 bits right?
> >
> >> I mean something along the lines of below diff (completely untested):
> >>
> >> modified   drivers/usb/dwc3/gadget.c
> >> @@ -1369,9 +1369,8 @@ static int dwc3_gadget_start_isoc_quirk(struct
> >> dwc3_ep *dep)
> >>  	else if (test0 && test1)
> >>  		dep->combo_num =3D 0;
> >>
> >> -	dep->frame_number &=3D 0x3fff;
> >>  	dep->frame_number |=3D dep->combo_num << 14;
> >> -	dep->frame_number +=3D max_t(u32, 4, dep->interval);
> >> +	dep->frame_number =3D DWC3_ALIGN_FRAME(dep, 1);
> >>
> >>  	/* Reinitialize test variables */
> >>  	dep->start_cmd_status =3D 0;
> >> @@ -1383,33 +1382,16 @@ static int dwc3_gadget_start_isoc_quirk(struct
> >> dwc3_ep *dep)
> >>  static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
> >>  {
> >>  	struct dwc3 *dwc =3D dep->dwc;
> >> -	int ret;
> >> -	int i;
> >>
> >>  	if (list_empty(&dep->pending_list)) {
> >>  		dep->flags |=3D DWC3_EP_PENDING_REQUEST;
> >>  		return -EAGAIN;
> >>  	}
> >>
> >> -	if (!dwc->dis_start_transfer_quirk && dwc3_is_usb31(dwc) &&
> >> -	    (dwc->revision <=3D DWC3_USB31_REVISION_160A ||
> >> -	     (dwc->revision =3D=3D DWC3_USB31_REVISION_170A &&
> >> -	      dwc->version_type >=3D DWC31_VERSIONTYPE_EA01 &&
> >> -	      dwc->version_type <=3D DWC31_VERSIONTYPE_EA06))) {
> >> -
> >> -		if (dwc->gadget.speed <=3D USB_SPEED_HIGH && dep->direction)
> >> -			return dwc3_gadget_start_isoc_quirk(dep);
> >> -	}
> >> -
> >> -	for (i =3D 0; i < DWC3_ISOC_MAX_RETRIES; i++) {
> >> -		dep->frame_number =3D DWC3_ALIGN_FRAME(dep, i + 1);
> >> +	dep->frame_number =3D __dwc3_gadget_get_frame(dwc);
> >> +	dep->frame_number =3D DWC3_ALIGN_FRAME(dep, 1);
> >>
> >> -		ret =3D __dwc3_gadget_kick_transfer(dep);
> >> -		if (ret !=3D -EAGAIN)
> >> -			break;
> >> -	}
> >> -
> >> -	return ret;
> >> +	return dwc3_gadget_start_isoc_quirk(dep);
> >>  }
> >>
> >>  static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct
> >> dwc3_request *req)
> >>
> >>
> >> Would there be any obvious draw-back to going down this route? The thi=
ng
> >> is that, as it is, it seems like we will *always* have some corner cas=
e
> >> where we can't guarantee that we can even start a transfer since there=
's
> >> no upper-bound between XferNotReady and gadget driver finally queueing=
 a
> >> request. Also, I can't simply read DSTS for the frame number because o=
f
> >> top-most 2 bits.
> >>
> > For non-affected version of the IP, the xfernotready -> starttransfer t=
ime will
> have to be off by more than a couple seconds for the driver to produce an
> incorrect 16-bit frame number. If you're seeing errors here, maybe we jus=
t need
> to code review the relevant sections to make sure the 14/16-bit and rollo=
ver
> conditions are all handled correctly.
>=20
> I think what Felipe may see is some delay in the system that causes the
> SW to not handle XferNotReady event in time. We already have the "retry"
> method handle that to a certain extend.
>=20
> > But I can't think of any obvious drawbacks of the quirk, other than doi=
ng
> some unnecessary work, which shouldn't produce any bad side-effects. But =
we
> haven't really tested that.
> >
>=20
> The workaround for the isoc_quirk requires 2 tries sending
> START_TRANSFER command. This means that you have to account the delay of
> that command completion plus potentially 1 more END_TRANSFER completion.
> That's why the quirk gives a buffer of at least 4 uframes of the
> scheduled isoc frame. So, it cannot schedule immediately on the next
> uframe, that's one of the drawbacks.
>=20
>=20

So the quirk is not ideal because it requires some extra time to retry star=
t transfers. This might cause delays for getting the first request out.

The best way for non-affected IPs is probably to NOT use the quirk, and cal=
culate the start transfer frame number based on the 16-bit xfernotready fra=
me number and 14-bit DSTS frame number. As long as the delay between the xf=
ernotready event and handling does not exceed 2 seconds, and you take into =
account rollover condition, this calculation should be correct.

The upper-bound between xfernotready and gadget's first request that you me=
ntion does not come into play, because if there is no request, the xfernotr=
eady event handler should do nothing. It should only do something when we h=
ave a queued request AND we get xfernotready.

John







