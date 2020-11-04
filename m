Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 032462A62F6
	for <lists+linux-usb@lfdr.de>; Wed,  4 Nov 2020 12:11:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729430AbgKDLLI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Nov 2020 06:11:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:53632 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728066AbgKDLLI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Nov 2020 06:11:08 -0500
Received: from localhost (otava-0257.koleje.cuni.cz [78.128.181.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 974F321556;
        Wed,  4 Nov 2020 11:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604488267;
        bh=nXUVAtygmawESmSumrMZwvlAPKxOTm6KcoJ271qgeno=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OiHaZda5laecmxqHg9f/Ocpu4QDX5BN8FbjJUF/0iJWrb+8lJGE9hdHl79sZNKyiH
         FTFqf4LuL1HdmKLLL3v38Lb8Ljx2qt2OI4x+6g6Jql43bJkaAYMxZxdVmjkPrSw5UD
         TfLTaJsPBRvLw3JUjdsj5CS6G71CSMf2FMJH0iJE=
Date:   Wed, 4 Nov 2020 12:10:53 +0100
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Vladimir Oltean <olteanv@gmail.com>
Cc:     netdev@vger.kernel.org, linux-usb@vger.kernel.org,
        Hayes Wang <hayeswang@realtek.com>
Subject: Re: [PATCH net-next 3/5] r8152: add MCU typed read/write functions
Message-ID: <20201104121053.44fae8c7@kernel.org>
In-Reply-To: <20201104110059.whkku3zlck6spnzj@skbuf>
References: <20201103192226.2455-1-kabel@kernel.org>
        <20201103192226.2455-4-kabel@kernel.org>
        <20201103214712.dzwpkj6d5val6536@skbuf>
        <20201104065524.36a85743@kernel.org>
        <20201104084710.wr3eq4orjspwqvss@skbuf>
        <20201104112511.78643f6e@kernel.org>
        <20201104113545.0428f3fe@kernel.org>
        <20201104110059.whkku3zlck6spnzj@skbuf>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 4 Nov 2020 13:00:59 +0200
Vladimir Oltean <olteanv@gmail.com> wrote:

> On Wed, Nov 04, 2020 at 11:35:45AM +0100, Marek Beh=C3=BAn wrote:
> > Or something like this?
> >=20
> > #define DEF_R_FUNC(_t, _r, _r_i, _mcu)				\
> > static inline _t _r(struct r8152 *tp, u16 index)		\
> > {								\
> > 	return _r_i(tp, _mcu, index);				\
> > }
> >=20
> > #define DEF_W_FUNC(_t, _w, _w_i, _mcu)				\
> > static inline void _w(struct r8152 *tp, u16 index, _t data)	\
> > {								\
> > 	_w_i(tp, _mcu, index, data);				\
> > }
> >=20
> > DEF_R_FUNC(u8, pla_ocp_read_byte, ocp_read_byte, MCU_TYPE_PLA)
> > DEF_W_FUNC(u8, pla_ocp_write_byte, ocp_write_byte, MCU_TYPE_PLA)
> > DEF_R_FUNC(u16, pla_ocp_read_word, ocp_read_word, MCU_TYPE_PLA)
> > DEF_W_FUNC(u16, pla_ocp_write_word, ocp_write_word, MCU_TYPE_PLA)
> > DEF_R_FUNC(u32, pla_ocp_read_dword, ocp_read_dword, MCU_TYPE_PLA)
> > DEF_W_FUNC(u32, pla_ocp_write_dword, ocp_write_dword, MCU_TYPE_PLA)
> >=20
> > DEF_R_FUNC(u8, usb_ocp_read_byte, ocp_read_byte, MCU_TYPE_USB)
> > DEF_W_FUNC(u8, usb_ocp_write_byte, ocp_write_byte, MCU_TYPE_USB)
> > DEF_R_FUNC(u16, usb_ocp_read_word, ocp_read_word, MCU_TYPE_USB)
> > DEF_W_FUNC(u16, usb_ocp_write_word, ocp_write_word, MCU_TYPE_USB)
> > DEF_R_FUNC(u32, usb_ocp_read_dword, ocp_read_dword, MCU_TYPE_USB)
> > DEF_W_FUNC(u32, usb_ocp_write_dword, ocp_write_dword, MCU_TYPE_USB) =20
>=20
> I'm not sure it's worth the change :(
> Let's put it another way, your diffstat has 338 insertions and 335
> deletions. Aka you're saving 3 lines overall.
> With this new approach that doesn't use token concatenation at all,
> you're probably not saving anything at all.
> Also, I'm not sure that you need to make the functions inline. The
> compiler should be smart enough to not generate functions for
> usb_ocp_read_byte etc. You can check with
> "make drivers/net/usb/r8152.lst".

Vladimir, the purpose of this patch isn't to save lines, but to save us
from always writing MCU_TYPE_USB / MCU_TYPE_PLA.
It just transforms forms of
  ocp_read_word(tp, MCU_TYPE_USB, idx);
  ocp_write_dword(tp, MCU_TYPE_PLA, idx, val);
into
  usb_ocp_read_word(tp, idx);
  pla_ocp_write_dword(tp, idx, val);

The fifth patch of this series saves lines by adding _modify functions,
to transform
  val =3D *_read(idx);
  val &=3D ~clr;
  val |=3D set;
  *_write(idx, val);
into
  *_modify(idx, clr, set);

