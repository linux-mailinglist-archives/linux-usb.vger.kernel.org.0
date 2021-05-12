Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B67E37B91F
	for <lists+linux-usb@lfdr.de>; Wed, 12 May 2021 11:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbhELJ3V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 May 2021 05:29:21 -0400
Received: from smaract.com ([82.165.73.54]:38152 "EHLO smaract.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229968AbhELJ3U (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 May 2021 05:29:20 -0400
Received: from mx1.smaract.de (leasedline-static-091-249-161-134.ewe-ip-backbone.de [91.249.161.134])
        by smaract.com (Postfix) with ESMTPSA id 5D83CA176F;
        Wed, 12 May 2021 09:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smaract.com;
        s=default; t=1620811691;
        bh=Bv6b9rWPP3U9Ix15ufpRZ2u5SPjemFgJV7rOVz8JEhM=; l=1013;
        h=From:To:Subject;
        b=hgPRXPhXAg867MjrJu8jyYOQAFeZjX0qURAJIJUklILxrAy7YCdnoHpiMJjO6f1Pl
         HUziZhS8tZw9IZkE4YEDOq4fCwoqNAoaWDx4luGJe6/bGEw+9ZNeMlsQRQ8xOLe+6u
         oPT1VUIlN+ETXh5/QgFp9aw1RXgVnyRX4u04u27I=
Authentication-Results: smaract.com;
        spf=pass (sender IP is 91.249.161.134) smtp.mailfrom=vonohr@smaract.com smtp.helo=mx1.smaract.de
Received-SPF: pass (smaract.com: connection is authenticated)
From:   Sebastian von Ohr <vonohr@smaract.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Thinh Nguyen <thinhn@synopsys.com>
Subject: RE: [BUG REPORT] usb: dwc3: Timeouts with USB 2.0 LPM active
Thread-Topic: [BUG REPORT] usb: dwc3: Timeouts with USB 2.0 LPM active
Thread-Index: AddAFrAj4smXgfxIQouaD3WoM/CLQ///+CEA///Z5yCAATySAP//rmbwgAJLAQD/9RYT8A==
Date:   Wed, 12 May 2021 09:28:10 +0000
Message-ID: <8ddf90943cd84c23966eb93fbc00722b@smaract.com>
References: <c9b5559a05f5459d92e3c704772edb46@smaract.com>
 <87eeenj56b.fsf@kernel.org> <3d2305a43c1f4e3dad2e29286f42982d@smaract.com>
 <87bl9rhv15.fsf@kernel.org> <da6ebfb4f58a4249a095d250d9abe3ed@smaract.com>
 <878s4ticf7.fsf@kernel.org>
In-Reply-To: <878s4ticf7.fsf@kernel.org>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-PPP-Message-ID: <162081169146.6589.6980628218005767771@smaract.com>
X-PPP-Vhost: mario.smaract.com
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> From: Felipe Balbi [mailto:balbi@kernel.org]
> > For a test I've changed some conditions in the driver so that
> > __dwc3_gadget_wakeup is also called on transfer updates and the link st=
ate
> > change also happens when in U2. This change actually fixed my timeout i=
ssue.
> > However, I'm not sure if this is actually the correct thing to do. I'm =
by far
> > no USB expert and I don't have access to the dwc3 databook.
>=20
> Right, AFAIR the databook was a bit unclear about this. It stated that
> it was required only for Start Transfer, but I always had the same
> doubt. No idea if the databook has been clarified since then.

Maybe somebody with access to the databook can clarify this? Since dwc3 def=
aults
to USB 3.0 speed and LPM enabled this should affect most USB gadgets users =
and=20
I'd like to see this issue fixed. I'm still wondering why there have been n=
o
previous reports for this bug (that I know of). Surely I'm not the only one
using a function FS usb gadget.
