Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B843236B0CE
	for <lists+linux-usb@lfdr.de>; Mon, 26 Apr 2021 11:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232140AbhDZJlb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Apr 2021 05:41:31 -0400
Received: from mx.exactcode.de ([144.76.154.42]:49112 "EHLO mx.exactcode.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232626AbhDZJl3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Apr 2021 05:41:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de; s=x;
        h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:From:Subject:Cc:To:Message-Id:Date; bh=iswZelAFynf1hhjFqKGPuErugeqg+TkUHoayyjL3/3A=;
        b=yeQC3Yz1JLYOTRu19o4sXBie6Z7wZKR/8luNnXeJ53e1flyGysW+E66D90DWOG8qoEqRXQru/Csvc3gA2EtJhPo1KaoaW7hSRQfEWq/+2zlEVCbl2Tqyv8hWM8nFDR/Sdlqx1aoZ3Z+gwwAjC3JEwc+iWB4f9GQRaDSBPhodBU4=;
Received: from exactco.de ([90.187.5.221])
        by mx.exactcode.de with esmtp (Exim 4.82)
        (envelope-from <rene@exactcode.com>)
        id 1laxjZ-0007TB-4B; Mon, 26 Apr 2021 09:40:53 +0000
Received: from [192.168.2.131] (helo=localhost)
        by exactco.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.86_2)
        (envelope-from <rene@exactcode.com>)
        id 1laxfu-0002LJ-W2; Mon, 26 Apr 2021 09:37:08 +0000
Date:   Mon, 26 Apr 2021 11:40:09 +0200 (CEST)
Message-Id: <20210426.114009.1308148203829096478.rene@exactcode.com>
To:     hdegoede@redhat.com
Cc:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH] unbreak all modern Seagate ATA pass-through for SMART
From:   Rene Rebe <rene@exactcode.com>
In-Reply-To: <c7f619f8-b5c5-2a27-9a9e-e757c5cf5802@redhat.com>
References: <0e698ca2-06e6-6ee7-1c39-a4352207a40e@redhat.com>
        <83FED4AF-2078-43BA-95A8-1EB44C13329D@exactcode.com>
        <c7f619f8-b5c5-2a27-9a9e-e757c5cf5802@redhat.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -0.5 (/)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>
Date: Mon, 26 Apr 2021 10:16:12 +0200

> Hi,
> =

> On 4/25/21 10:52 PM, Ren=E9 Rebe wrote:
> > Hi,
> > =

> >> On 25. Apr 2021, at 20:25, Hans de Goede <hdegoede@redhat.com> wro=
te:
> >>
> >> Hi Rene,
> >>
> >> On 4/25/21 5:02 PM, Rene Rebe wrote:
> >>> Alan Stern <stern@rowland.harvard.edu> wrote:
> >>>
> >>>> On Sun, Apr 25, 2021 at 02:15:36PM +0200, Rene Rebe wrote:
> >>>>> From: Greg KH <gregkh@linuxfoundation.org>
> >>>>> Subject: Re: [PATCH] unbreak all modern Seagate ATA pass-throug=
h for SMART
> >>>>> Date: Sun, 25 Apr 2021 14:00:26 +0200
> >>>>>
> >>>>>>> I would expect that more modern devices to work. Vendors usua=
lly
> >>>>>>> linearly allocate their product ids for new devices, and we c=
ould
> >>>>>>> allow list product ids higher than this Seven to unbreak more=
 modern
> >>>>>>> devices by default and limit the amount of device quirks need=
ed?
> >>>>>>
> >>>>>> Vendors do not allocate device ids that way at all, as there i=
s no
> >>>>>> requirement to do so.  I know of many vendors that seemingly u=
se random
> >>>>>> values from their product id space, so there is no guarantee t=
hat this
> >>>>>> will work, sorry.
> >>>>>
> >>>>> I did not say it is a requirement, just that they usually do sp=
eaking
> >>>>> of just this Seagate case. What is wrong with using that to
> >>>>> potentially significantly cut down the quirk list?
> >>>>
> >>>> You didn't read commit 92335ad9e895, did you?  It lists a large =
number =

> >>>> of Seagate devices that don't work with ATA pass-through, and th=
ree of =

> >>>> them have product IDs that are larger than 0xab03.
> >>>>
> >>>> Please check the facts before guessing about things that will ca=
use =

> >>>> problems for other people.
> >>>
> >>> I really don't appreciate the unfriendly tone on the linux kernel=

> >>> mailing lists (which is why for 20 years I never felt like contri=
buting
> >>> here mo),
> >>
> >> I'm sorry to hear that the admittently sometimes unfriendly tone
> >> on the kernel mailinglists have stopped you from contributing.
> >>
> >> Note that I do believe that things have gotten better recently.
> >>
> >> As for this email-thread, I don't really see anything wrong with
> >> Alan's reply here. You have been quite argumentative in this entir=
e
> >> thread about how things would be much better if they are done your=

> >> way.
> >>
> >> I cannot speak for the others but I certainly have gotten annoyed =
by
> >> the tone of your emails so far, I apologize if any of that annoyan=
ce
> >> has bleed through in the tone of my emails. I do strive to always
> >> stay professional (but as all of us I'm only human).
> >>
> >> <snip>
> >>
> >>>>>> What is wrong with just allowing specific devices that you hav=
e tested
> >>>>>> will work, to the list instead?  That's the safest way to hand=
le this.
> >>>>>
> >>>>> The problem is that out of the box it does not work for users, =
and
> >>>>> normal users do not dive into the kernel code to find out and s=
imply
> >>>>> think their devices sucks. Even I for years thought the drive s=
ucks,
> >>>>> before I took a closer look. If you long term want more new dev=
ices in
> >>>>> an allow list than the previous quirk list included (9 or 10 do=
es not
> >>>>> sound that many to me), ... whatever you prefer ,-) I would rat=
her
> >>>>> have 10 quirk disable list than potential many more white liste=
d the
> >>>>> next years to come. Maybe we shoudl simply restore the prevoius=

> >>>>> quirks.
> >>>>
> >>>> That's a possibility, and in the future we may do it.  But proba=
bly not =

> >>>> until the enable list grows to a comparable length.
> >>>
> >>> Yeah, why future proof it now, ...
> >>
> >> Perhaps look in the mirror and start with improving the tone of yo=
ur
> >> own emails ?
> > =

> > Thanks, I re-read them and find them pretty ok.
> =

> I was directly referring to your "Yeah, why future proof it now, ..."=

> remark here. But more in general I personally find the tone of your
> emails in this thread somewhat "combative".
> =

> I believe that in the end we all want the same thing which is to help=

> Linux users to get the best experience possible. It just seems that w=
e
> disagree on how to reach that goal.
> =

> Assuming that I have that correct, then I believe that there is a lot=

> of common ground between us; and I wish that we could approach this
> in a way where we try to find a solution which we can all agree on.
> =

> Ideally we could just wave a magic wand and make this all work,
> but unfortunately reality is not cooperating, so we need to come up
> with some pragmatic solution here.

I did not mean to be compative, however, as usual in real life we just
do not agree with all the reasoning ;-)

> > On further internet searching that there are at least 4 more driver=
s
> > listed on the smartmontools page that should work:
> > =

> > 	https://www.smartmontools.org/wiki/Supported_USB-Devices
> =

> That is a very interesting link thank you. That certainly advocates
> for a generic approach introducing a new US_FL_ATA_1X_OK and then
> adding quirks setting that for both your model and the 4 models
> listed there.
> =

> I would really appreciate it if you could submit a patch series
> for this. But if you don't want to do that then I'll put this on
> my own TODO list.

Maybe another week, however, as this is not the semantic I prefer that
would only cause more work for me with a bigger reverting patch in our
tree at the end, ...

<snip>

> > Given this, I will not continue spending my time on implementing
> > what you suggested and instead simply reverted this for our Linux
> > SDE as I believe results in the best out of the box experience
> > for our users:
> > =

> > 	https://svn.exactcode.de/t2/trunk/package/base/linux/uas-seagate.p=
atch
> =

> I've taken a quick peek at this and I see that you've also restored
> the old per model quirks to disable ATA pass-through on known to be
> broken models, good.

Yes, I reverted that, and added two more I found from the old email
thread that probably triggered the code change back in the day.

> Note that the list of broken models which you've added it missing the=

> 0xab25 and 0xab38 product-ids which according to:
> https://www.smartmontools.org/wiki/Supported_USB-Devices
> have broken ATA passthrough support with UAS.

Thanks, I added those two now as well.

> If I assume that these behave as some of the other Seagate drivers an=
d
> the bridge-chip crashes when trying to use ATA pass-through, then onc=
e
> these changes hit your users and customers you have just broken usage=

> of those disks together with your product. This nicely illustrates
> why we don't want to make this change in the mainline kernel.
> =

> Note depending on how important disk performance is for you
> an alternative approach might be to modify the Seagate product-id che=
ck
> to simply disable UAS on Seagate devices, that would be a lot safer.

We do not run a smartd by default, and I actually prefer a driver that
deaults to behave by the standard book, and get notified when
something goes wrong, instead of globally disallow listing a whole
vendor.

Maybe it is still an option to restore the updated unusual quirk list
entries, that way users with newer devices get their SMART back sooner
than later and this also encourages Seagate to continue producing
fully working devices, without hiding any ATA pass-through bugs by
default ;-) Given the hidden nature of this, it probably would take
more than a decade to ok-list working devices by interested users,
which hopefully going forward should hopefully be all new ones.

	Ren=E9

-- =

  Ren=E9 Rebe, ExactCODE GmbH, Lietzenburger Str. 42, DE-10789 Berlin
  https://exactcode.com | https://t2sde.org | https://rene.rebe.de
