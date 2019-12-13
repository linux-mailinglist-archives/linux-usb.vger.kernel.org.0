Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAD8111E8FF
	for <lists+linux-usb@lfdr.de>; Fri, 13 Dec 2019 18:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728420AbfLMRMn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Dec 2019 12:12:43 -0500
Received: from mx02.owlhost.in ([148.251.182.159]:39396 "EHLO mx02.owlhost.in"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728384AbfLMRMn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 13 Dec 2019 12:12:43 -0500
X-Greylist: delayed 610 seconds by postgrey-1.27 at vger.kernel.org; Fri, 13 Dec 2019 12:12:41 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ow1.in;
        s=main; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
        Content-Type:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=gZqDGbLNodBHLwIkabmSdnzSr5GEwpvAX3MWf6BVOmI=; b=S4SNFMV8ytSymWTfOAL4TOH+TZ
        Sop1IwPUNdsiz61CAZ+iile1K0wgJaKd+FoNRmkjOrM/LiZefUZitl6HzDWuzWY2lPFKdrgIvcx9q
        fgkgK2u+Gd8cRIYqlg/7RvVyklm29N4KhSiCVUUCI4b1PF79UU3qeuIC13X8Z4d5w6qU=;
Received: from [10.21.1.4] (port=50042 helo=mail.owlhost.in)
        by mx02.owlhost.in with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (envelope-from <owl@ow1.in>)
        id 1ifoKj-0007Fh-Q8; Fri, 13 Dec 2019 17:02:29 +0000
MIME-Version: 1.0
Content-Type: multipart/signed;
 protocol="application/pgp-signature";
 boundary="=_a5644ce9324039fac3ddbe08d86ba392"
Date:   Fri, 13 Dec 2019 17:02:28 +0000
From:   Ilia Pavlikhin <owl@ow1.in>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: About Bug 205841
In-Reply-To: <20191213162333.GA19292@kuha.fi.intel.com>
References: <20191213162333.GA19292@kuha.fi.intel.com>
User-Agent: Roundcube Webmail/1.4-git
Message-ID: <4bf56a03d4511319164f0028a283fafe@ow1.in>
X-Sender: owl@ow1.in
Organization: OwlHost
X-SA-Score: 1.6
X-SA-Report: Spam detection software, running on the system "mx02.owlhost.in",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello. I've got your patch, apply to sources 5.5.0-rc1 and
    builded with oldconfig from 5.4.2. And... Well, got black screens and blinking
    CapsLock. It's hard to explain without any output. I'll try building [...]
 Content analysis details:   (1.6 points, 5.0 required)
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
 -1.9 BAYES_00               BODY: Bayes spam probability is 0 to 1%
                             [score: 0.0000]
  4.5 SPF_NOT_PASS           Not fully validated by SPF.
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)

--=_a5644ce9324039fac3ddbe08d86ba392
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII;
 format=flowed

Hello.

I've got your patch, apply to sources 5.5.0-rc1 and builded with 
oldconfig from 5.4.2. And... Well, got black screens and blinking 
CapsLock.
It's hard to explain without any output. I'll try building 5.5.0-rc1 
with your patch tomorrow and new config.

Thank you for reply.

P.S.: I have another one dock station from Lenovo at home (like this) 
and try testing on it.

On 2019-12-13 16:23, Heikki Krogerus wrote:
> Hi Ilia,
> 
> Bugzilla at kernel.org does not respond today, so sending mail.
> 
> I can't reproduce the issue with the Lenovo boards we have, but I know
> there is one problem with the firmware in some Lenovo's. Basically the
> firmware starts generating notification (interrupts) before they are
> enabled. That could theoretically cause the issue you are seeing.
> 
> Can you test v5.5-rc1 (mainline)? If the problem still happens with
> mainline, can you test a patch that I've attached (so applied on top
> of mainline)?
> 
> thanks,

---

With best regards
Digital Owl

--=_a5644ce9324039fac3ddbe08d86ba392
Content-Type: application/pgp-signature;
 name=signature.asc
Content-Disposition: attachment;
 filename=signature.asc;
 size=488
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEETWg1A0zsFbHJSwlMkoKgPeEMnUsFAl3zxCUACgkQkoKgPeEM
nUs9vQf/QiJV3u6qaJ+vIwym2AAYwZQrhFfiJDSSimVq1OeejpwosjNWTsYDoVRW
JRiVNCoAvak1q4EBWQoqKUop7y9NxhQh1onuNBcc98aPiO9GVBEa3feYpIgIpIUZ
FovCGjQgDfAk89FoksajyRLouA9uGB/UxOlOLf/OqepS0mjgcZBWkvMOKsxjwDjc
9ceASV95K/IF3SgeqQbDyK7P0OMBNF8g2ie6KDAyZQjVxIgkEUp1sCCJPPI3YTDX
LxVHmxwjrBHssRQNdKQk8na/HG4cgwhn212BgLi2aXHw/z76ghSkPqVyMXFotr9F
Qz0D2LpNF5sJBr8RvgNb2BpMFxeEMQ==
=EDix
-----END PGP SIGNATURE-----

--=_a5644ce9324039fac3ddbe08d86ba392--
