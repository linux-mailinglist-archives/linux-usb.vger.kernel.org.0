Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30C4A13BC32
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 10:15:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729145AbgAOJPd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 04:15:33 -0500
Received: from mail-lf1-f42.google.com ([209.85.167.42]:33451 "EHLO
        mail-lf1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbgAOJPd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 04:15:33 -0500
Received: by mail-lf1-f42.google.com with SMTP id n25so12157625lfl.0
        for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2020 01:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:subject:date:message-id:mime-version;
        bh=NOt4BwaRVlPut4PiH6Z66uus0EZI4iFmGFBB+P6bwsY=;
        b=QNUmPYinBQoTwR5Edo9KU8VDhKDToGraF6kc6XZUY9VHXqmO+lEG5A12W/Lku0Ha8a
         7VV3nJJsvi3fM4RyEMZRGvk9ejVLWSwzIDGeZFpUjJ9x4D5CTu7L71Nv++e5bbowMXV9
         uHQh5zxDz6qGafHeRaWspX1g9XKLEcQc+MNHwvIq6OKNkoC+4visfqAD6H5nB8/Fgt3u
         ifYT/HI5YDcUJy9hMIfto4eTO0ZExpcLH91PKOCqyrg9yi4Ra1Kr2snX0c7/CTp+R0Qi
         k1nDBAiCEiez6V6bJ/N6ASOBm+lOxGTnaKCwEStZk7nEZCtwyBmJFesBA+CjMh1HXlaK
         vZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :mime-version;
        bh=NOt4BwaRVlPut4PiH6Z66uus0EZI4iFmGFBB+P6bwsY=;
        b=EeN3pFzbEdclZ4hlHZCJRQ6OO9AXUj7//PlJAqzXIrJiDMl2ru/0Vjww21SMENea2s
         pNIpB/PYo0uhMDpU/Ur9FQdNJcXRiIceW4LwrYL0rm8ygxvEJbv4ajay9581cHRcFoba
         DHoZSyRV7dwifsvejJ1jinM1xizhOsxizQCR+Rwhz7B+MG9TRGZQNfW6qQ2LLYgIC3Gf
         v1XzARWk39SJHV76fIY0yu3w7aq9nulOuBk25M/5mbDPavjaP3UniynRtEnRzFKIhYe5
         9IkrdGpovg4NIkvs8qRy/er/z1yGvyeAWHiv+0Chzg8EmwFyJcMbRp8R5oSirXAumSL5
         IhWQ==
X-Gm-Message-State: APjAAAVX5+wTCdVMiW2AEIy8IcKXe9rOIjdcIO+QTuBx46PG+6BWhukO
        poq8SehdDhq9AfvJgP9N+nuAYe54kIw2Cw==
X-Google-Smtp-Source: APXvYqw0OUO0LjphFexGGyZyplioBAw1WlWrXC6odtkm/yLSQ4KYLH93IWYd/wBDJ0BWnNSZN1wQZg==
X-Received: by 2002:ac2:4909:: with SMTP id n9mr4367826lfi.21.1579079731034;
        Wed, 15 Jan 2020 01:15:31 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id n23sm8608984lfa.41.2020.01.15.01.15.30
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 01:15:30 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     linux-usb@vger.kernel.org
Subject: [ANNOUNCE] linux-usb inbox flushed
Date:   Wed, 15 Jan 2020 11:16:31 +0200
Message-ID: <875zhd6pw0.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi guys,

I just sent a pull request to Greg and, as a result, I have flushed my
linux-usb inbox.

If your patch is not in that list, you can assume I didn't get or lost
it while moving jobs. Please, wait a few days before resending your
patches.

Thanks for understanding

cheers

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4e2G8ACgkQzL64meEa
mQY80hAAkSfvKHENdxbc/BHqZd3iC+sWCu0L9EZJQ6d4mtY0+CQLiol1tWk75GBW
vjYdg3Mb0JCSeeNH1atcw2dKxsv1d0fEM7p6UkBieSxthfYf2Xfa1lmFUEc0Bs0A
e5485ssunJBTFEPrav4V7OmWXeMzezTOYlvCEbPRqdn6BSVSpEuQE+ctZnQEVdAl
NE5HcJ4wCubtiBQ4gW/zZt5k9u22V9qE2eyLFGRTrKyuGajTiZY+Ms4IhTLIwMZ/
27GEvTuEaZmerMhXQ45oRJ/JE/P6BvNClnF/NWnJGjtrH5ZrNAflQX7F9JzH3y1L
2eIR+Y+XRwu9VyECOCow6Z7Gqwc9LNjZU1to/NGmKVb54inE4bAtVrafBLxbzFVE
HGQo7zzFm/AOxAD4STBkSBZg7lHoctNwzNwNWUj7MIhg4PY4SFl60mUNps+0K5c8
n3fFWeBu/XC4ESfqvuBsn+ewMDTOc6u8ak2W5McsUFkt6k/ZPffogsfaD75KrcNE
CTPF+B83/Q0reKUpYQrfR/UlSlQ7MDEDgo4y1iBoQ0/V1+B7errUvFfehpZZ2/HE
TwDLCbDjSD38qjGfgG3Okofogueewcqt8rR+Y0MZhsQbPhzh2vDDc3p/68v+Daka
wT9kARRYF9sKuHqDTH6mVh/busn3du6NY1I6x/gaklu9fAIcfFE=
=xG0W
-----END PGP SIGNATURE-----
--=-=-=--
