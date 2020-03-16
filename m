Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C65418655A
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 08:00:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729875AbgCPHAU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Mar 2020 03:00:20 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36035 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729722AbgCPHAU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Mar 2020 03:00:20 -0400
Received: by mail-lj1-f194.google.com with SMTP id g12so17343340ljj.3
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2020 00:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=3zjuWFB9TTFSugi8cZx4IQFtwxTd8g1rm6gc67PnLHY=;
        b=EvDBI6VDkP4PTHm9z4iIbpX1YU8RkOwKZzV8cOJfhxvAhJpZ8G1Zm3xbld5ngupNW1
         4cTO63wrRhITl0hIzPsHQNOmDjK0LJ1oQEdZBZsjD6edrWAHkYfk1gH/N41RHktrY5s5
         YcrHpngdyfp2WlMQVlX6jeaVViMxxIbQR4R+KZiVLXh0LUZacpJjXTTTBJ67qdMKFv4L
         +cLXFT10UIQ8/YS4XsKaSk1uCw9e0o5vrfNYXg+uTNZI0nm3SjdIDa1auE+liqqZz8Cl
         H6w5J3NYx8d899juxPlyZgVL0p3rguar20EfjcAgaMjGrQaV5nUaReRa4eeheUvrbvxN
         eoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=3zjuWFB9TTFSugi8cZx4IQFtwxTd8g1rm6gc67PnLHY=;
        b=hqrwp5dEBjiTZYI0xkx39WXZRMGD0d0u+k2NPIXMpZHPGMiGy1qQKMugVaGUyhNhVp
         QnfVEYvJe+LYIBHf14FjKxt7bwJlFUibC/zxCNx3QrqUg3FV4IyGPVfcymNU0DbDpX7Q
         UjQaAM79ehwfBtLSolwFJux7lDgkR6n0d3RyxPDeKCzXzE3vSJgs17Ucyt32vo5YopF0
         mafWa5+X3j1bbhuq7wkyEUp12C9orxVoX9s3zuszF9vChV+UrmiR0s2pgjllNzFHtJcG
         kixgZAcIkwayhbgzs6eTP4cIvcMGsm8Gp9DGyGa/fly165W2KSpIHsUtatlQWhine6N0
         +5Pw==
X-Gm-Message-State: ANhLgQ2jW65D5Yc7So3DhuM4uF3xJ0rDXADE9jO2Te/NcOKPgYeZjyW2
        oPSQIICguvqBPRutUcBIfIWZrg1aSso=
X-Google-Smtp-Source: ADFU+vtjd8dX7K9rr9m/uXmAXUf+nJWW6KhpDhuHAGY/aNBCnrAGmsJjzavhfyBR3Pd8xJSdQNZrwg==
X-Received: by 2002:a2e:9903:: with SMTP id v3mr15587246lji.96.1584342017761;
        Mon, 16 Mar 2020 00:00:17 -0700 (PDT)
Received: from saruman (88-113-215-213.elisa-laajakaista.fi. [88.113.215.213])
        by smtp.gmail.com with ESMTPSA id l4sm2460916lji.68.2020.03.16.00.00.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Mar 2020 00:00:16 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Remove incomplete check
In-Reply-To: <df600201-0063-bb5f-19be-ecbeaada37f0@synopsys.com>
References: <660a74249e64b3b62ca9b394584387baee67a119.1583466150.git.thinhn@synopsys.com> <87d09ef01l.fsf@kernel.org> <df600201-0063-bb5f-19be-ecbeaada37f0@synopsys.com>
Date:   Mon, 16 Mar 2020 09:00:12 +0200
Message-ID: <87blow239f.fsf@kernel.org>
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


Hi,

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
>> Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
>>> We only care to resume transfer for SG because the request maybe
>>> partially completed. dwc3_gadget_ep_request_completed() doesn't check
>>> that of a request, at least not fully.
>>>
>>> 1) It doesn't account for OUT direction.
>>> 2) It doesn't account for isoc. For isoc, a request maybe completed with
>>> partial data.
>> I would rather fix the function for these cases instead of removing it
>> completely. While at that, also move the req->num_pending_sgs check
>> inside dwc3_gadget_ep_request_completed()
>>
>
> If we want to keep this function, the only thing this function does is=20
> to check req->num_pending_sgs. We'd only resume the request because=20
> there are pending TRBs from SG not completed yet. If all the TRBs of a=20
> request are completed, regardless if all the data are received/sent, we=20
> don't queue them again. Do you still want to have this function?

The function gives a name to a very specific "concept", that of a
completed request. You can see that even today, the function is super
simple: OUT direction is always completed, IN direction is completed
when actual =3D=3D length, we're just missing the pending_sgs check. So
something like the hunks below.

One thing I don't get from your patch is why you're completely removing
the function and why isn't req->direction and actual =3D=3D length not
needed anymore. Could you explain?

hunks:

@@ -2482,7 +2482,8 @@ static int dwc3_gadget_ep_reclaim_trb_linear(struct d=
wc3_ep *dep,
 			event, status, false);
 }
=20
=2Dstatic bool dwc3_gadget_ep_request_completed(struct dwc3_request *req)
+static bool dwc3_gadget_ep_request_completed(struct dwc3_ep *dep,
+		struct dwc3_request *req)
 {
 	/*
 	 * For OUT direction, host may send less than the setup
@@ -2491,6 +2492,16 @@ static bool dwc3_gadget_ep_request_completed(struct =
dwc3_request *req)
 	if (!req->direction)
 		return true;
=20
+	/*
+	 * If there are pending scatterlist entries, we should
+	 * continue processing them.
+	 */
+	if (req->num_pending_sgs)
+		return false;
+
+	if (usb_endpoint_xfer_isoc(dep->endpoint.desc))
+		do_something();
+
 	return req->request.actual =3D=3D req->request.length;
 }
=20
@@ -2515,8 +2526,7 @@ static int dwc3_gadget_ep_cleanup_completed_request(s=
truct dwc3_ep *dep,
=20
 	req->request.actual =3D req->request.length - req->remaining;
=20
=2D	if (!dwc3_gadget_ep_request_completed(req) ||
=2D			req->num_pending_sgs) {
+	if (!dwc3_gadget_ep_request_completed(dep, req))
 		__dwc3_gadget_kick_transfer(dep);
 		goto out;
 	}

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl5vI/wACgkQzL64meEa
mQYhKg//WyTrfcAYEMkeK6NRjjSC3XBIh1rtxWLCy+Z7c1GPPuw3FLJsYj14IYVm
N5E+XJpP7mh4QJfnJeud1VdR38kMtPv7SLXRyuufRuyzdaA/JkQoiaEp2Etv8K6W
26rroZ2HT+Kza8k50TcUAvqxE9n383T+QdCuoaxDNSN10EJ7mlGpm9AuN8HmFOM2
KZe67AkUSRzAh91NIPwGYd/22IiwTZDo4gdG7WcE/Qu7zhXxqSm8O/hKF0Qr2Qa1
zItADoyuKPpb8I8NTEWYkSDQGccnHaSNEDAtOQ1cI5p7oHbhFETEeeByVnGWXryu
Qoib9SVKBiOtwoQtWmpKaqSsTG9AN11kmYrgG/uNfN3qVG8/J0ehVdAijvI059BF
3paSlXPGp7zFiIA/FemRjqu5VpYdHiH3l6XkBSFBIhNt+ExGliNY3tjDRNiczveF
sS6v6WZ2d/JfEDFrLEtUM5MCrq9KUmllJQzvC96T4GV0DbupczB3Ik1uFVma3IRH
9apRK5jqG4yz10vsGgJ743oIAYgD3ODpcZgBc7xuUE67tTX1Wwkinud+jReKQNNj
V6KBvaATgHSiTmjCBSp/RZQ9yCj3dLgzprwA3Bv6OIAfe4hjHkPDcZ1A7nnXPf1H
HcDc/O/CFfkWrhvBT9OCrgKOWjaO452Nj+PsgZ8zaACNsLzf3bo=
=KMkX
-----END PGP SIGNATURE-----
--=-=-=--
