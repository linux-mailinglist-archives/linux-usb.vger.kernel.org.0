Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 673EF387F37
	for <lists+linux-usb@lfdr.de>; Tue, 18 May 2021 20:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346650AbhERSFl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 May 2021 14:05:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36959 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1351442AbhERSFl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 May 2021 14:05:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621361062;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=++IBdwTXrkj6TN5tFUW8jJ28IMikx/q1mGUkdBnMJhQ=;
        b=TvP6SUvsosmJNV4Tgl1EjD/3HJfmb5RIpzSd/Xt3iev008Dq84YfFYjV4O/ofbcBeZTu7u
        1vQyCL0QSgNcT0gDtCacLpUo46lvzrwcRTSoiYsMJ2fTXYquFj2Yh8MFTyeqKzNeKZA51p
        J6BnXMFFvJvNEO/4U0GO7FDfEjLASsM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-kCrkDdrXOXa_8ChRCoHaMw-1; Tue, 18 May 2021 14:04:18 -0400
X-MC-Unique: kCrkDdrXOXa_8ChRCoHaMw-1
Received: by mail-wm1-f70.google.com with SMTP id r15-20020a05600c35cfb029017373d9f318so407857wmq.4
        for <linux-usb@vger.kernel.org>; Tue, 18 May 2021 11:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=++IBdwTXrkj6TN5tFUW8jJ28IMikx/q1mGUkdBnMJhQ=;
        b=kL4zH7+MigXWsmRqC0d4gp8P6Ks7yQQjRwJbgUnJn+KV9peSqdQnscVGN4xo3gnVCz
         vH9gYIzoLS/BfpGK1Z+7Al7bapy9vIoFGN/xD7qQ4qKwuBQlF+heKLBhtdF1anI++7D/
         PfK2DV9tO8qcJQmPGVLaHDMJRufOlZ8YD7PnL98vzhV4JW+T/GFnu5qLEzDkZZ3fyf0g
         JE3ZTklfJPamEQbIH2YCMWnfvNU1NgQn5kMhGDPvR4b+Ti4FrzCBomChZ1MfN5+pXAY6
         NiRR3JfyJ3N06JGV2KemWaD1xH8d9eIkFczeEZLM1WSmMQMnkPHOqMYKI24WzR5ihteu
         OYrw==
X-Gm-Message-State: AOAM533P4ZnxrAjg16XbQNdvUF9QXZb3jqW9i0yZuaU0N2TkD9bBspIM
        h+kJ9HSTTeE/JX4dBu/E5i5cZk0cGV+E2Pmxopwez+0NU0quBRyQU3mhh3Rp31+nEtv/PAJV82R
        7DXud4NB+k5UvgNIBurr9
X-Received: by 2002:a5d:4d4f:: with SMTP id a15mr8504155wru.187.1621361057355;
        Tue, 18 May 2021 11:04:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxz2ecus/fq0739wSNsydOGIu6BVxS+/X8uhGrDB66UzjMvRLyJ2oO3ndANIDXUitrRYiOjxA==
X-Received: by 2002:a5d:4d4f:: with SMTP id a15mr8504127wru.187.1621361057141;
        Tue, 18 May 2021 11:04:17 -0700 (PDT)
Received: from ?IPv6:2001:16b8:2613:bffc::185? (200116b82613bffc0000000000000185.dip.versatel-1u1.de. [2001:16b8:2613:bffc::185])
        by smtp.gmail.com with ESMTPSA id t7sm15798905wrs.87.2021.05.18.11.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 11:04:16 -0700 (PDT)
Message-ID: <7c09a6bf2ee0a644863f1ec8b333c871cf83d5b8.camel@redhat.com>
Subject: Re: [PATCH] usb: typec: ucsi: Clear pending after acking connector
 change
From:   Benjamin Berg <bberg@redhat.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 18 May 2021 20:04:14 +0200
In-Reply-To: <YKPBPqZ6zHBsCnsO@kuha.fi.intel.com>
References: <20210516040953.622409-1-bjorn.andersson@linaro.org>
         <YKI/XT8qpZDjDuqs@kuha.fi.intel.com> <YKJeYzIgvL/soGgw@kuha.fi.intel.com>
         <cd62e9a6d317e106db5e5d6b5f36170524ed7ad9.camel@redhat.com>
         <YKPBPqZ6zHBsCnsO@kuha.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-8Z+unxOuqkr2aCvCa/tM"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-8Z+unxOuqkr2aCvCa/tM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-05-18 at 16:29 +0300, Heikki Krogerus wrote:
> On Mon, May 17, 2021 at 02:57:28PM +0200, Benjamin Berg wrote:
> >=20
> > [SNIP]
> > Unfortunately, I don't feel it'll work. The problem that I was
> > seeing
> > looked like a race condition in the PPM itself, where the window is
> > the
> > time between the UCSI_GET_CONNECTOR_STATUS command and the
> > subsequent
> > ACK.
> > For such a firmware level bug in the PPM, we need a way to detect
> > the
> > race condition when it happens (or get a fix for the firmware).
>=20
> OK. Let me know does the patch bring the issue back for you.

So, I just tried the patch, and I can occasionally reproduce the issue
where "online" for the ucsi power adapter is stuck at "1" after
unplugging with the patch applied.

Benjamin

--=-8Z+unxOuqkr2aCvCa/tM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEED2NO4vMS33W8E4AFq6ZWhpmFY3AFAmCkAZ4ACgkQq6ZWhpmF
Y3CUXQ/+JPiXi/zXLZ1HUWY+VnsNNMv4cFtjtbtcc1AapCU34szVwLnwuycWtBpO
1wHuiAH4SV+YwFEn5w2qNv4KI268p7bKZPiAtAcohloNGfC45TJ7GCVZmGzIE98I
7nsIyfiB0IgQBAh5LDf7M8WTyANQgrPqx4urq7jBWdPX9vrqvELnNKK6awfuYFJe
3MZVfWwM94JEZ40TcQPfLpO35Wth4ZN7B9BimMD8ZmqoXri9cHxnJQXE9/LtXEht
rM5JTItnd4V1V84ytPfy62GblTR0DhHjAWpDKYU03kKH6F11qj0usNd3D1lpWabo
rr1dFup7h85iJxHH5FaBqGWFBJu4Vi0jU4/q/lGPde2uGxnPI2v+vSMtFzzCEJer
mThkDvLZAIik+f7Gpv4qAF1Rmi7E5xFVQfHV7Pi2ntQCJDKPlf6bvL6PAu8ICwIf
aXvInWh7pROGtxkA41GPc/fzKBOL/kZcxcBPokp+JOWNoM2/XF3zN9v7mN0GeNqr
uKz43aclO5qi+dI/H21EBNi3rIuCN64yS1GTq65aa4KkGBcyPjzGo+5BYQ34pmkl
gVp/oWOqNMhBkh6w+FE9CrDxiNUEqpPYK5ND8FMmsMHorQybkP+k0Cp7ff7f+chw
TxQcBPQQUZBlLMAuz2l23eVk4vFKFtHQOJ6nd7lQwonjF++u7ds=
=NiPb
-----END PGP SIGNATURE-----

--=-8Z+unxOuqkr2aCvCa/tM--

