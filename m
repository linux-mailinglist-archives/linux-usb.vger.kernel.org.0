Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8032F774F
	for <lists+linux-usb@lfdr.de>; Fri, 15 Jan 2021 12:15:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727496AbhAOLOI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Jan 2021 06:14:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:41232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725831AbhAOLOI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 15 Jan 2021 06:14:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C31F2235F9;
        Fri, 15 Jan 2021 11:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610709208;
        bh=Ah8fITGZSMYyxsoJ2OMIXXckJoRxcxue8sshMHf9ECA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=DVJzDNbt8F28MblEnsu+qMtEyjoKaLnX8iSSXX3maMyK9h0v6Lb30iy078u0fvNmc
         koPIXta1/7EZN9BYIkF/iAw0jEpdbEg0jiiUkaxIZta4IgHLwZGJPuf4W+thoz76xN
         rBCBYcQRenYkdkFHKXxGpPTANxY2/GOMOW0oxQx0KTVPi9PGjdjQGwM1Yz88u9oEBn
         yedwUm0NNHcjJJukPXZlpt2+k6kfKelPYFWZzFFzLpH5mnFLV2xxjdM9xfHlRx41qk
         DgH1FzbzkUc4skx9sYtRS2vGoW9054XkKf4C/wS8XY4cVEG6wYeT7jUuZrq2xbsm63
         FV8YD305XjeMw==
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v6 09/11] usb: dwc3: gadget: Implement setting of SSP rate
In-Reply-To: <13fad6ff-f056-f6ab-713b-68794113e03c@synopsys.com>
References: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
 <1bbbb6cd0d80696c0b1c112a225dad0b0efe8b91.1610592135.git.Thinh.Nguyen@synopsys.com>
 <871ren3kg8.fsf@kernel.org>
 <13fad6ff-f056-f6ab-713b-68794113e03c@synopsys.com>
Date:   Fri, 15 Jan 2021 13:13:21 +0200
Message-ID: <87v9by1mi6.fsf@kernel.org>
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

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> Felipe Balbi wrote:
>> Hi,
>>
>> Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
>>> @@ -2476,6 +2506,17 @@ static void dwc3_gadget_set_speed(struct usb_gad=
get *g,
>>>  	spin_unlock_irqrestore(&dwc->lock, flags);
>>>  }
>>>=20=20
>>> +static void dwc3_gadget_set_ssp_rate(struct usb_gadget *g,
>>> +				     enum usb_ssp_rate rate)
>>> +{
>>> +	struct dwc3		*dwc =3D gadget_to_dwc(g);
>>> +	unsigned long		flags;
>>> +
>>> +	spin_lock_irqsave(&dwc->lock, flags);
>>> +	dwc->gadget_ssp_rate =3D rate;
>>> +	spin_unlock_irqrestore(&dwc->lock, flags);
>>> +}
>> it would be best to make this return a value. If udc_set_ssp_rate() is
>> called with invalid rate, UDC can notify core.
>>
>
> The core should know what ssp rate the gadget supports via the
> gadget->max_ssp_rate capability field. Any rate beyond that is invalid.
> Is it necessary to have a return value here? This uses the same logic as
> udc_set_speed()

Yeah, I don't know what I had in mind when I made ->udc_set_speed()
void. Then again, we know exactly who's calling it and we can guarantee
that no invalid values will be passed. There's no way for, for example,
userspace (via ffs) to call it with a bogus value.

Perhaps it's okay, but something to keep an eye for both
=2D>udc_set_ssp_rate() and ->udc_set_speed().

Thanks for pointing me back at ->udc_set_speed().

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmABeNERHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQYQaw/1GBueMdih0JYf+tFigGSRwKtR5Vq/rYGE
tI086uqBT8XvMaLhPDKw/D57IeYEw28NVH3klVxNn1ZUNhBQ7D2UkoGqy6c3mb1O
wAM0wjiiVXkFQJ1Mjx9r1Yt5kvpNzNU5pV4Q+4PiqPJqo3tTsi1ujnUMBbrR9nGh
sDPTnIw2ze+OP+Z6dsOUH6TbaYbxpgTzNn/WztR5nExrcXekBApjsHP/QJXr7PWP
+Y8/pWx+xmAGg+stbqtH/To1c98yXi/qqGFvRt0K14P7hzouodUHYTzDM9p1uemM
RH5Wc0dzYLY5mo3jXUjwQRmXaM3EJA3KRY2p0ZzYXBn0M25NHFEPIifsMZMbdfOI
0T8P01Rf+hV6MGuAU5aocrRrvP5UR+6qm5BwYjpeuS9Pely571YdsxmUZZ5jku0D
bWDfp9dTfg2PFa/cjPNzEkLJ2nMLb4qVKrTqN2id+9lJHdWJ/gm7OuZi7ZZgZYTe
YddGMNKKIboMeqtoSDVDbBYrYJcDr98nVJbNSYgtl9kxpDU5cT9csKo16oWfpTal
JwM3smzMSWgOqdyQa4MzDYTkvfy5ccHzhWFisaFtWHxVRE1MhbInV9ZZMImmbIk8
I2ItXbYZSQ1uHJEtgAUWwIPoRx0Nb5Va7tKu9btbG8ODZ8Tkhx+umP7PafrzsepX
Px4CDpraAQ==
=cP4E
-----END PGP SIGNATURE-----
--=-=-=--
