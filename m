Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB7E388D3C
	for <lists+linux-usb@lfdr.de>; Wed, 19 May 2021 13:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352491AbhESLv6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 May 2021 07:51:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53829 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1352465AbhESLv5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 May 2021 07:51:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621425038;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=XviUa+1k+6nIu6mVSYqq6rrlCi8pn1oe+Aw+0oVnwmU=;
        b=A3m7cXeZHXF/hd+MTi23RiquKLopvTBiCzlja9KC3QVJD9nALNHsr8fcHha+q8xrF+pXrZ
        wLog0v1tN58CeCHCrpcYkzX0ei2QrFnjX2h89dath52S+rxNCiK9KMp5EqcJWG819u7rIf
        umDQWoaSgZOh0u3MsZsrgz5iByhnH0Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-nWRjILsqMoaJnx8dhmbbeg-1; Wed, 19 May 2021 07:50:35 -0400
X-MC-Unique: nWRjILsqMoaJnx8dhmbbeg-1
Received: by mail-wm1-f71.google.com with SMTP id h9-20020a1cb7090000b029016d3f0b6ce4so1478598wmf.9
        for <linux-usb@vger.kernel.org>; Wed, 19 May 2021 04:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=XviUa+1k+6nIu6mVSYqq6rrlCi8pn1oe+Aw+0oVnwmU=;
        b=eDGc12KN/2p+QUcp+uifTlwyHMiA6AwOAObe7xMF6YrkHUu54e/4qoznW+9rKqISxO
         biVq39wrFjI6c/mn0+PdUDeWOght7q4GYSYhLt4nJR55KxiR8lrSoKUEC14wLlP1juBa
         iB8aecK/yPYXnEPpZkPByFUcjRoZqqosTsuwtdBvNrku1Ya50GRmqs2pXQtOxnDDkTb6
         JwOjKC/mGWfnsOcBtfzb3T27Xtrxer0dEaAi8DbphG24UV+RMNnaxQA+mKkKFiY4UM10
         gWoG1jeORAxchc3mCwYohUheZ4NG+y08ln75IWNtvWXnPy7Or3UcxRUmIDt2HqbqaNGa
         q51Q==
X-Gm-Message-State: AOAM530CIFd+PxOgi/3KYcHrh7RZwvctmeJ4Yl5vi91qsGgOpkFYXv37
        I/wIIhuIuBPf8wXtJmohVi6YaiRkafPlQJmvt1QK8/gv+v85IPmsEAWQeU1/vw4W1VU8C0l9bOw
        tFl8Gf/7J556fH+KMdqwM
X-Received: by 2002:adf:9f51:: with SMTP id f17mr14035650wrg.3.1621425034753;
        Wed, 19 May 2021 04:50:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOHh24TbAnsyzXL0oCK9FU3+pmRZup44O9oe2qHbSEKDMHp6SGHQ3ROv77XVxDPw4odSM6TQ==
X-Received: by 2002:adf:9f51:: with SMTP id f17mr14035633wrg.3.1621425034580;
        Wed, 19 May 2021 04:50:34 -0700 (PDT)
Received: from ?IPv6:2001:16b8:265f:e3fc::185? (200116b8265fe3fc0000000000000185.dip.versatel-1u1.de. [2001:16b8:265f:e3fc::185])
        by smtp.gmail.com with ESMTPSA id t7sm18665253wrs.87.2021.05.19.04.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 04:50:34 -0700 (PDT)
Message-ID: <339ffb6f02457f7a293f19dbfed2aaf724f5c3d9.camel@redhat.com>
Subject: Re: [PATCH] usb: typec: ucsi: Clear pending after acking connector
 change
From:   Benjamin Berg <bberg@redhat.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 19 May 2021 13:50:31 +0200
In-Reply-To: <YKT3oEt/9fX8k8mw@kuha.fi.intel.com>
References: <20210516040953.622409-1-bjorn.andersson@linaro.org>
         <YKI/XT8qpZDjDuqs@kuha.fi.intel.com> <YKJeYzIgvL/soGgw@kuha.fi.intel.com>
         <cd62e9a6d317e106db5e5d6b5f36170524ed7ad9.camel@redhat.com>
         <YKPBPqZ6zHBsCnsO@kuha.fi.intel.com>
         <7c09a6bf2ee0a644863f1ec8b333c871cf83d5b8.camel@redhat.com>
         <YKT3oEt/9fX8k8mw@kuha.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-XcjbHHWXgMLPTtE0u8WR"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-XcjbHHWXgMLPTtE0u8WR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-05-19 at 14:33 +0300, Heikki Krogerus wrote:
> On Tue, May 18, 2021 at 08:04:14PM +0200, Benjamin Berg wrote:
> > On Tue, 2021-05-18 at 16:29 +0300, Heikki Krogerus wrote:
> > > On Mon, May 17, 2021 at 02:57:28PM +0200, Benjamin Berg wrote:
> > > >=20
> > > > [SNIP]
> > > > Unfortunately, I don't feel it'll work. The problem that I was
> > > > seeing
> > > > looked like a race condition in the PPM itself, where the
> > > > window is
> > > > the
> > > > time between the UCSI_GET_CONNECTOR_STATUS command and the
> > > > subsequent
> > > > ACK.
> > > > For such a firmware level bug in the PPM, we need a way to
> > > > detect
> > > > the
> > > > race condition when it happens (or get a fix for the firmware).
> > >=20
> > > OK. Let me know does the patch bring the issue back for you.
> >=20
> > So, I just tried the patch, and I can occasionally reproduce the
> > issue
> > where "online" for the ucsi power adapter is stuck at "1" after
> > unplugging with the patch applied.
>=20
> Thanks for testing it.
>=20
> I'm still not sure that the PPM is the culprit here. I have a feeling
> that the problem you are seeing is caused by the workaround (bad
> workaround) that we have for the issue where the EC firmware does not
> return with the BUSY bit set in the CCI when it should in many cases.
> The UCSI ACPI driver has one minute timeout value for command
> completion because of that, which is way too long. So if the EC
> firmware decides to take its time before acknowledging command, the
> driver is stuck, and we start loosing the events...

Hmm, interesting, yes. If the PPM is sending a second change event
before or after we ACK'ed the first one, and we loose this event, then
that would absolutely explain the issue I am seeing.

In my case, I was able to considerably increase the probability of the
bug by inserting a sleep just before acknowledging the connector
change. Not sure whether this is meaningful, but maybe that tells us
something about who is at fault here.

Benjamin

> Well, I guess
> technically the PPM would be the culprit in the end in any case, but
> I'm just not sure that there is any race like you suspected.
>=20
> But this is off topic. I'll send you an RFC proposal what I think we
> could do about that.
>=20
>=20
> thanks,
>=20


--=-XcjbHHWXgMLPTtE0u8WR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEED2NO4vMS33W8E4AFq6ZWhpmFY3AFAmCk+4cACgkQq6ZWhpmF
Y3D0sg/8CDF7hWwvLKZ75qOTY852GUjhJ462jiTVILJmXfADbvqYGoItnNe92qQZ
GDROv9dctE15hIDuC0pymi26iVbIBOD+oQ58oZrmTdZz0E8sGcW+fQ1x0XBruz0u
MijLlslZMf0+KlFQEq8p44DsxyuUaKMIR5VSebHy3RwpVLhXZoPYVCQT3odKPtcQ
6TSsFQXxwndOpTemhYOHKiKAuyao9LQ2Bifw7kESiCs94hDnJs7HP5IONGF8uTod
NvZxfxbjE7rNMQVqjAaYL08YIpaldGwwV8mU81l/N42v0U49iwJVyoGXXTR8SEnk
gRvLTeFWOfKxu6mV/dR75QcLQX7r73CGlBvAesb33A3QkslXxoRfvmXwLakufXqz
Zrbgzvm3ZiXTVB+22cgsY0dOFMPu3XxNmO7O2PfgsoaYSHPenIXTyS6nptfO/rQZ
O+ZWUmSgn0cmxcF7GILanJcS9vjqPdBFHprKQhaP934/YWmtyhLw5fds/0frGCjy
0eUawptVIsb+kmp0y7yJCFyCTb6iG9v5TjHtjnlBMOFmTqq5FhIl2TpyIKLlllT4
Fibqvjyykrz4xNFD0QM/Vy9UsZjwk4CaTdHegyZ/qlmHX+zvjiyGMoAo7b99+D3o
mzo1/wJx1XHJxUWS7lcEaSQCnjP6mWkALfFa7Vl8VtICf/pAFWg=
=l9/L
-----END PGP SIGNATURE-----

--=-XcjbHHWXgMLPTtE0u8WR--

