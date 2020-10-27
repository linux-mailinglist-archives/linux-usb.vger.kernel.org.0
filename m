Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E330029AA30
	for <lists+linux-usb@lfdr.de>; Tue, 27 Oct 2020 12:02:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898844AbgJ0LB6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Oct 2020 07:01:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:38624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2898802AbgJ0LB6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 27 Oct 2020 07:01:58 -0400
Received: from saruman (88-113-213-94.elisa-laajakaista.fi [88.113.213.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 88197218AC;
        Tue, 27 Oct 2020 11:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603796517;
        bh=rtiaAwqYMXhB+qkfHAwBFqHMH04cfa1g5U/vwn4qr8w=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=VAXnknkYHojsVY0wgrAv4B/wUYogK2PgYziRmf6OS3IGZcMpO80mH/mfcs4SwH4jj
         ofSTWe8e5Z2lFUaJkbCWGyht0Q1sWtDTjkONEAELNO+dONoAvrr2MxaWp/J/sGN2d4
         4t4YMVF7UE9IlTz8/gSRUmL5toBfczmewsTYp4fY=
From:   Felipe Balbi <balbi@kernel.org>
To:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v2 01/15] usb: dwc2: Fix/update enter/exit partial power
 down.
In-Reply-To: <c4ea45e2-e7d4-1299-ced6-c93689546f2c@synopsys.com>
References: <20201011135059.76B73A005E@mailhost.synopsys.com>
 <87d014dqpo.fsf@kernel.org>
 <c4ea45e2-e7d4-1299-ced6-c93689546f2c@synopsys.com>
Date:   Tue, 27 Oct 2020 13:01:50 +0200
Message-ID: <87wnzcaq5d.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Artur Petrosyan <Arthur.Petrosyan@synopsys.com> writes:
> Hi Felipe,
>
> On 10/27/2020 12:21, Felipe Balbi wrote:
>>=20
>> Hi Arthur,
>>=20
>> before I review your series, there are few things I'd like to point out:
>>=20
>> 1. A single patch should do one thing and one thing only
>>=20
>> 2. Every single patch should compile and work on its own
>>=20
>> 3. When sending a series, remember to include a cover letter
>>=20
>> 4. When sending a series, you can rely on git to produce a thread with a
>>     cover letter
>>=20
>> 	git format-patch -o series --cover-letter HEAD~15..
>>=20
>> 5. Remember to run checkpatch on every patch
>>=20
>> 6. Please, read https://www.kernel.org/doc/html/latest/process/submit-ch=
ecklist.html
> The above statements are of course done before submitting to LKML.
> Moreover each patch is first of all tested using Jenkins, and passed a=20
> review process on gerrit.

The fact that you're doing multiple things in a single commit should
have been caught during your internal review process. John, Minas, did
any of you review these patches before submission? Please make sure
details such as this are caught before hand ;-)

> Did you see any build error? or checkpatch error?

just a general comment, seen that patches were not send as a reply to
patch 0, in a separate thread.

>> Artur Petrosyan <Arthur.Petrosyan@synopsys.com> writes:
>>> - Updated entering and exiting partial power down function
>>>    flow. Before there was a lot of confusions with core
>>>    entering to partial power down in device or host mode.
>>>
>>> - Added "rem_wakeup" for host exiting from Partial Power
>>>    Down mode from host remote wakeup flow. According to
>>>    programming guide in host mode, port power must be
>>>    turned on when wakeup is detected.
>>>
>>> - Added "in_ppd" flag to indicate the core state after
>>>    entering into Partial Power Down mode.
>>>
>>> - Moved setting of lx_state into partial power down
>>>    specific functions.
>>>
>>> - Added dev_dbg() messages when entering and exiting from
>>>    partial power down.
>>>
>>> - During Partial Power Down exit rely on backuped value of
>>>    "GOTGCTL_CURMODE_HOST" to determine the mode of core
>>>    before entering to PPD.
>>>
>>> - Set missing "DCTL_PWRONPRGDONE" bit when exiting device
>>>    partial power down according to programming guide.
>>>
>>> - Added missing restore of DCFG register in device mode
>>>    according to programming guide.
>>=20
>>  From a quick read, it seems like each of these topics deserve a patch of
>> its own. Could you break this down into smaller patches? Also, you have
>> colleagues who have been dealing with the community for a long time,
>> perhaps ask them to do an internal round of review before submitting?
>>=20
>> That may help you get your patches merged in a timely manner.
>>=20
> I will work on breaking this patch down into smaller patches I could do=20
> this before of course the reason I didn't break them down was that I=20
> didn't want to make the patch series so big.

too big series are not a problem. Too big patches doing multiple things
generally are. Keep in mind that you want maintainers to receive
patches that obviously correct.

> Thank you very much for the advice. I will also invite the colleagues to=
=20
> test or give a review.

thanks

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl+X/h4RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQYBIRAAoZOPSveU4jPu+KboiHlvTf0svVeSYmkM
V1JGVjcTl63huRkDjU/JmHstEHqEAhjdOj+TD2i6Eg47z4N5MOiTghP1j1Z6DxYx
+7GjovK8o9Vz1bEkl0FmvT9qjlPL21DgGRIMSavRnTC981kWnL9tOJacztGVlzuE
eTulw81TiqIEfjaw8x6Sz9KRXIGwnsKLHHRm2f48crSc/XTbT1Xe9wFrNUFxelFW
+W+q63f3+9NNZPdyOjNM/J0ldaF3eg9WXSVZ6FNmbrTbnU4p9CkC4CaG3FEmneLG
ymCA+WvKs8r3LKe7bapVhnh+HEqW5K8f2g8v04ppOHzDMMSCDlbC+1tgwZlpC3Zo
wd3f3IGHCaI5SQpVkJTIlrWoykIJvZGlC2eblFNzm/CqoG+m+Nw7LLLk6z19Qn3P
l8psj996W+tx3tyaDvMQrffB7d7iJS3i0Gf14MJxTEdQ3wRqogghUZWi/NTN2vpT
Y5LQjt9IaA8xXWL/7mNqsYokbKQzKHQJCsG82HSVZj9+lt16u2V7njDE31zNYwO/
W8UtWzjxv93dfZeJysecVn7eZZXtrlykG97N83Bv5SmaIU/dIC4PDZ9aq92gsj4i
/atLOSqy8SnkTLYMjjb6oPmM+4LjfdJlkxRBlWFYkjJtxO5JWkSy1FHDbfqjgFmF
9CUcjE+UdbM=
=OaHI
-----END PGP SIGNATURE-----
--=-=-=--
