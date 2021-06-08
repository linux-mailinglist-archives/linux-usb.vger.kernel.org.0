Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D04253A0484
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jun 2021 21:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239397AbhFHTgD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Jun 2021 15:36:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33022 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237729AbhFHTeC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Jun 2021 15:34:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623180728;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1p5fMfPKJv8flgbhVd1qMPM5Lt1Pt/3jocRKCMPKgns=;
        b=GCqlZx0dujdazERKj49meNLIyVQhqEmUanOzEkQanQOD70VMWA667r0H1jFos2AzB6LxZK
        gMiCmkzlaXH+taDO10/SnhLc/BeZunWondaCkCMe7NZ5FE3Lrd7sBbRjyKqkkbWQ23d2WW
        WiyGl67yZx27fA50Ny5mR2tBq35scLE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-ScVVPxGJOUuc7GZYvoqHRA-1; Tue, 08 Jun 2021 15:32:05 -0400
X-MC-Unique: ScVVPxGJOUuc7GZYvoqHRA-1
Received: by mail-ed1-f69.google.com with SMTP id j13-20020aa7de8d0000b029038fc8e57037so11314570edv.0
        for <linux-usb@vger.kernel.org>; Tue, 08 Jun 2021 12:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=1p5fMfPKJv8flgbhVd1qMPM5Lt1Pt/3jocRKCMPKgns=;
        b=B6KtR/SwoG5tUAyFwNxb5Xb9R5gtTm76m/H0azcvnwPSLe3HqLZ4pd9+vdsRDVYXRy
         hYWO708tKikNnL2l+bFdseKJmTrmuWBoSOgVxYVCALrVe+oEYwYZkq+oTsCYyYuBpcDH
         cLUJCjw3mg6VE7JTJadUrKjwDhVpvFFP6pWkTgk1rrL2lDUnUVhOb2L2yV9l1vY5BDna
         OU4D1Au2hlSSntg247xGL7k37phmlaI1Wl48PyR7oyOwa06Yk4QWhCgx002+/sDW0hd6
         AdFA3vgUpmJL+B2EW8cMNmZ1Y4BsLXkazMExy75/vGorJr+3cbugy6krKGs0Pstl455T
         7BtQ==
X-Gm-Message-State: AOAM533iKzSteCeLOyAXaEbaJiJiBc3XFgaYO4mNzJ6BVOnkbz/7mZfD
        GjYme0Jat8J35Vq9PyhcCh5EfQOTauOKI/D17TtnGwz/2uhlrtLXlQp/4pWYycf8ND8s7xxi98d
        qhgIXx7dmRixhCG10vvva
X-Received: by 2002:aa7:ca50:: with SMTP id j16mr26965481edt.158.1623180724049;
        Tue, 08 Jun 2021 12:32:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4ZyaIjOxcVJvWEcErkpAn2qsw4vOq3MnyFnTCizlAxRHIAvplT/X46+Bw63dr7YhzwU/8aw==
X-Received: by 2002:aa7:ca50:: with SMTP id j16mr26965471edt.158.1623180723815;
        Tue, 08 Jun 2021 12:32:03 -0700 (PDT)
Received: from [10.0.4.217] (i59F7C257.versanet.de. [89.247.194.87])
        by smtp.gmail.com with ESMTPSA id qh23sm224888ejb.77.2021.06.08.12.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 12:32:03 -0700 (PDT)
Message-ID: <f9e1640d4d1a2acbaacf83dee021cd4aa55f233f.camel@redhat.com>
Subject: Re: [RFC PATCH 0/7] usb: typec: ucsi: Polling the alt modes and PDOs
From:   Benjamin Berg <bberg@redhat.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 08 Jun 2021 21:32:01 +0200
In-Reply-To: <YL8UD+nlBSSQGIMO@kuha.fi.intel.com>
References: <20210607131442.20121-1-heikki.krogerus@linux.intel.com>
         <4a76d2152f016b58298bec16aa2003a6ec55f8a8.camel@redhat.com>
         <YL8RPiVsEFOM9PBo@kuha.fi.intel.com> <YL8UD+nlBSSQGIMO@kuha.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-+tUZK2kr5TN2iQ/7TYMn"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-+tUZK2kr5TN2iQ/7TYMn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-06-08 at 09:54 +0300, Heikki Krogerus wrote:
> On Tue, Jun 08, 2021 at 09:42:09AM +0300, Heikki Krogerus wrote:
> > Please check does the partner device get removed. What do you have
> > under /sys/class/typec after that happens?
>=20
> Oh yes. Could you also share the trace output when that happens?
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd /sys/kernel/debug/tracing
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo 1 > events/ucsi/enable
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # now reproduce the issue
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cat trace > ucsi.trace

So, the partner device is still there when this happens (see below). I
also only see a single event in the trace for the fast plug/unplug
case:
   kworker/u16:8-1771    [003] .... 18848.872145: ucsi_connector_change: po=
rt1 status: change=3D4a04, opmode=3D5, connected=3D1, sourcing=3D0, partner=
_flags=3D1, partner_type=3D1, request_data_obj=3D1304b12c, BC status=3D1

The typec port/partner states is:

port1-partner/accessory_mode:none
port1-partner/supports_usb_power_delivery:no
port1-partner/uevent:DEVTYPE=3Dtypec_partner
port1-partner/usb_power_delivery_revision:0.0

and

port0/data_role:host [device]
port0/power_operation_mode:default
port0/power_role:source [sink]
port0/supported_accessory_modes:none
port0/uevent:DEVTYPE=3Dtypec_port
port0/uevent:TYPEC_PORT=3Dport0
port0/usb_power_delivery_revision:2.0
port0/usb_typec_revision:1.0
port0/vconn_source:no
port1/data_role:host [device]
port1/power_operation_mode:3.0A
port1/power_role:source [sink]
port1/supported_accessory_modes:none
port1/uevent:DEVTYPE=3Dtypec_port
port1/uevent:TYPEC_PORT=3Dport1
port1/usb_power_delivery_revision:2.0
port1/usb_typec_revision:1.0
port1/vconn_source:no

Note that for a normal plug I am usually getting a second event. This
second event is occasionally missing though:
  kworker/u16:38-1800    [001] .... 19522.325885: ucsi_connector_change: po=
rt1 status: change=3D4a04, opmode=3D5, connected=3D1, sourcing=3D0, partner=
_flags=3D1, partner_type=3D1, request_data_obj=3D1304b12c, BC status=3D1
  kworker/u16:38-1800    [004] .... 19522.552613: ucsi_connector_change: po=
rt1 status: change=3D0044, opmode=3D3, connected=3D1, sourcing=3D0, partner=
_flags=3D1, partner_type=3D1, request_data_obj=3D1304b12c, BC status=3D1

and a working unplug consistently looks like:
   kworker/u16:8-1771    [003] .... 19670.020085: ucsi_connector_change: po=
rt1 status: change=3D4804, opmode=3D0, connected=3D0, sourcing=3D0, partner=
_flags=3D1, partner_type=3D1, request_data_obj=3D1304b12c, BC status=3D0

Benjamin

--=-+tUZK2kr5TN2iQ/7TYMn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEED2NO4vMS33W8E4AFq6ZWhpmFY3AFAmC/xbEACgkQq6ZWhpmF
Y3DdfA/+OcGOiFiPtEDgR+6t+HnMr7KJsPjP+LjffBEeea5bCtiPswjeH6bqlt8U
pquAB/bj5qQ1VO2SyczMzwuy8eJSYNyJ6Yc/cb5CxUtFIjAE6xXhgMNguj2T8C3V
62EMl/WzFI0jfJ4Ow6bhgwlnA4CJXq0qX04MuRWnEJ2YMwEoMnnh9buxtoPVu2pm
cfZcXB/QFkOGC17IEq/d1PmnZQZNtisFz6l1RnhrwL/IvJC4FoUhzC6jmJlsXl9b
y0b6lFNZHM4euLvp38TUNMAEubxRa+v3wYa2bwMbBF75S+A8jvQntYrpWurNJEit
c67Qrnu5OhcjZuHONCmXJIS5i8icegBUavAwfuX+5EGfd0N0rxH3vfP3AmHy+3iu
/UfmEEZrA0QMsLzOUsjY80P7NaesxcFHph21EugBAeKGgvtMxZ3evLLlKUxIWi+5
tNQOCS0Xg2Ql5A4pMAFwY2QUZ3dDyeAWEqeOmcOAL/btnCne/VmRHNiIyX/Ldpqc
5Th7zHShYQNuFypo7y2DxL7lltsXAaYjKGMD6QycqoSLwpLEV1bimsI0V4EoX/vo
8aqsN87Of/jKw6FXa+UstKon5iHnxqKGz7QDkJ/8gtWG5GZHhZpR1sQ+P864V8cI
KD48/6bsNBv2i7pxo5EQkqKKoCzBcTErRt4D744M2VTIltwJ2wI=
=SJ8r
-----END PGP SIGNATURE-----

--=-+tUZK2kr5TN2iQ/7TYMn--

