Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC7A9766471
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jul 2023 08:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233167AbjG1Gta (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jul 2023 02:49:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjG1Gt3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jul 2023 02:49:29 -0400
X-Greylist: delayed 61 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 27 Jul 2023 23:49:27 PDT
Received: from h2.cmg1.smtp.forpsi.com (h2.cmg1.smtp.forpsi.com [81.2.195.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0C1719B
        for <linux-usb@vger.kernel.org>; Thu, 27 Jul 2023 23:49:27 -0700 (PDT)
Received: from [192.168.1.166] ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id PHGuqQdvWPm6CPHGwqknNL; Fri, 28 Jul 2023 08:48:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1690526903; bh=wNCr6ECi53A9+aj5+69BlskR7OtUltgiHZXVfwsSghI=;
        h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version;
        b=Pd7E5VNjX8JQvOheV+6el81wzHB2N8eG1Yy2csQGd0pAzeHa932zd692MSL0jlcol
         EgXW9WCRcnR+6t5uErQcyOIt3yfh8+Ks3JT865pZMZzz3rNAf8a6OibuD/JYILecBO
         l/XQ/i3XHR1YtFTycUxnZPqGPlxDe4D0pOqpcb4bpXIiALD2ORcDa1p3boEZPFCnVM
         9WNSjpfia1zVdXTc4K6kLbq9W4RQiQqY9MqRZ7a3aNem2gHYkZI/GHXDXkmORMz18S
         6xfhMMgDmoBg8/J9Lk20RzY+KpmuF+60ICxNLyYQmcJ+EEugaLoDdx6U90fiprRDKi
         reNDwNgrFjQUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1690526903; bh=wNCr6ECi53A9+aj5+69BlskR7OtUltgiHZXVfwsSghI=;
        h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version;
        b=Pd7E5VNjX8JQvOheV+6el81wzHB2N8eG1Yy2csQGd0pAzeHa932zd692MSL0jlcol
         EgXW9WCRcnR+6t5uErQcyOIt3yfh8+Ks3JT865pZMZzz3rNAf8a6OibuD/JYILecBO
         l/XQ/i3XHR1YtFTycUxnZPqGPlxDe4D0pOqpcb4bpXIiALD2ORcDa1p3boEZPFCnVM
         9WNSjpfia1zVdXTc4K6kLbq9W4RQiQqY9MqRZ7a3aNem2gHYkZI/GHXDXkmORMz18S
         6xfhMMgDmoBg8/J9Lk20RzY+KpmuF+60ICxNLyYQmcJ+EEugaLoDdx6U90fiprRDKi
         reNDwNgrFjQUg==
Message-ID: <fbceb8e5444eab23788501b002926e07f54fdd7c.camel@triops.cz>
Subject: Re: [usb:usb-testing 25/42] drivers/usb/dwc3/dwc3-octeon.c:403:10:
 warning: shift count >= width of type
From:   Ladislav Michl <ladis@triops.cz>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel test robot <lkp@intel.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-usb@vger.kernel.org
Date:   Fri, 28 Jul 2023 08:48:20 +0200
In-Reply-To: <2023072653-viewable-harmonics-09e0@gregkh>
References: <202307260537.MROrhVNM-lkp@intel.com>
         <2023072653-viewable-harmonics-09e0@gregkh>
Organization: Triops, s.r.o.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJEvISPn+xE8iYqJouYIpnSQ0RL60IieVgfhbgeJFAK0k0hQ2zMHO713m3FaJ9QegWffSg17lbVogstW6+U1LwFfuBxvHB7dA1S2FPstwxQcSFCL3/E9
 s0AfghZhOEly6UCdf/m+9QsDBBe3frppc4hbKcyWi8LB2VMGSgmCdfPLzfu9gjiMHG+h3aOEt34kxLXQsFqtIC3PbtlMHSDWitNACcZAmxBeJTxoWpPpRzPG
 n2s6wXVxoCwAUubis4oUWX1TVyiLEZ/x4M5LIfwzTvibpbScfkqUIF36LE+sQYUo5ym4JuHsYTzCRMP7d9ZiyQ==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

I'm sorry for late reply (travelling)

On Wed, 2023-07-26 at 06:39 +0200, Greg Kroah-Hartman wrote:
> On Wed, Jul 26, 2023 at 05:09:56AM +0800, kernel test robot wrote:
> > Hi Ladislav,
> >=20
> > First bad commit (maybe !=3D root cause):
> >=20
> > tree:=C2=A0=C2=A0
> > https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git=C2=A0usb=
-
> > testing
> > head:=C2=A0=C2=A0 ac47051f0bb8ccf1eaedb296a19fcb541474db53
> > commit: b3061c5a15fe460502e9574b4663dd7c6ed80b48 [25/42] usb: dwc3:
> > dwc3-octeon: Convert to glue driver
>=20
> Ladislav, I've dropped your dwc3-octeon patches from my tree now,
> please fix up and resend when you have this resolved.

As I didn't find a better place to ask, I'm asking here:
all registers are 64bit and driver is now using GENMASK and BIT
macros to access their values. Reported problem comes from 32bit
configuration, where BIT is UL(1) << (nr) and BITS_PER_LONG is 32.
Is using GENMASK_ULL and BIT_ULL preferred way to go here? I'm not a
bit fan of "fixing" code just to silence warning on irrelevant
configurations, but will do it unless someone points me to better way.

Thank you,
	l.
