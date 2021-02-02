Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85B0D30B93A
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 09:08:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232262AbhBBIG7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 03:06:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231509AbhBBIGv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Feb 2021 03:06:51 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEA0BC061573
        for <linux-usb@vger.kernel.org>; Tue,  2 Feb 2021 00:06:10 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id j12so13794242pfj.12
        for <linux-usb@vger.kernel.org>; Tue, 02 Feb 2021 00:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=xdsSCNqRT6pmI8PDRatFSJJyOi2y+t4BEGL1p6JdYS8=;
        b=a2gcKjdkHx8c5T+5arN64AbLg0NvYBu4Sfj9M0yHD+WYIg/Bby4oyC5Q68bCkO5I+b
         lXKAgMFgqWc0FbcSzErQN8kWk6a2OLzO6BNHhv7AqpzsuFfsYduFtA+5TqKlKRVqZk3r
         0kpmhWxMVNkSuLRJ9koWskTQMPJozqu+01TKbsHrZj/DoIKAQsJrH0rgcYashy+sqXZ+
         lmq8BBDo8veAWmf9ZMtNxTsRTOQSovTXrJqVxf1gL6GUTqLV/UEFROSzaFvx5abwem8v
         7lTgAghagOzruYDqaKpfGcXilVYGXOXRgrQ7zDT1P8FaWwWXzMOKp1JN5unnnIpAq7PH
         EDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=xdsSCNqRT6pmI8PDRatFSJJyOi2y+t4BEGL1p6JdYS8=;
        b=EXQUsLvBg24/iKEcueZxGesSGGc154wFGaqLPxu1e8xNXU+cwNYz3z5xoHhTUHx9u0
         1cymWcVeBLBdA3v3R3mM1uApkonm4YWXy9o5MIc00tz44Qdx8Ijgv8QHRRyVBspxBUWo
         8GFud8ds51l3nKx7rPsfywYU81VZ+On9r60btEnGy/LhDqGIbog2wmvA+wCitNzicFRj
         CYys/gsQ23g7TIp4EO9FTPAJeF+yS9KgVd6NMS03iE0uXP8gJUd2cWgskdo7+Aespe9/
         1ykMHEvggisWFYgTSGYx9mChedqKK34IB58IwQxQq5dvkxNBoXrMyKPFFo1KBotx2j/k
         8W8Q==
X-Gm-Message-State: AOAM531wRR2MpzWzv/XNuWyq6d62ScaxyAfdtYGl1rc8NpzSMVx5tR/j
        RTw+VcJVnhW5IKM2jOh34y7vSA==
X-Google-Smtp-Source: ABdhPJyUdQEWpf4FFRm6WDwnXFFSFPzK6zZFwUWld1lUJv6xNRPgEZvQKCPEep5fxzL1x6uYyvEylg==
X-Received: by 2002:a62:18d6:0:b029:1bf:1c5f:bfa4 with SMTP id 205-20020a6218d60000b02901bf1c5fbfa4mr20095420pfy.24.1612253169862;
        Tue, 02 Feb 2021 00:06:09 -0800 (PST)
Received: from google.com ([2620:15c:202:201:f693:9fff:fef4:fc72])
        by smtp.gmail.com with ESMTPSA id gb12sm1876180pjb.51.2021.02.02.00.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 00:06:08 -0800 (PST)
Date:   Tue, 2 Feb 2021 00:06:03 -0800
From:   Benson Leung <bleung@google.com>
To:     gregkh@linuxfoundation.org
Cc:     enric.balletbo@collabora.com, bleung@chromium.org,
        bleung@google.com, bleung@kernel.org, linux-usb@vger.kernel.org,
        pmalani@chromium.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] Immutable Branch between platform/chrome and USB for
 v5.12 merge window
Message-ID: <YBkH6wO07sxRDBDo@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="C9BBXJRw27joBAeF"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--C9BBXJRw27joBAeF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

The following changes since commit 29b01295a829fba7399ee84afff4e64660e49f04:

  usb: typec: Add typec_partner_set_pd_revision (2021-02-01 15:31:34 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git t=
ags/tag-ib-usb-typec-chrome-platform-cros-ec-typec-changes-for-5.12

for you to fetch changes up to 0371616d8bef6926e9aa05757f35b901268d3724:

  platform/chrome: cros_ec_typec: Set opmode to PD on SOP connected (2021-0=
2-01 23:49:54 -0800)

----------------------------------------------------------------
cros-ec-typec changes for usb for v5.12

Chrome OS EC Type-C driver features implemented this round:
* Registration of cable plug information
* Support for SOP' plug registration and altmodes
* Support for reporting number of altmodes supported by partners and plugs
* Send mux configuration ack to EC via a new host command
* Reporting SOP' and Partner PD revisions

----------------------------------------------------------------
Benson Leung (4):
      Merge remote-tracking branch 'origin/cros-ec-typec-for-5.12' into ib-=
usb-typec-chrome-platform-cros-ec-typec-changes-for-5.12
      platform/chrome: cros_ec_typec: Report SOP' PD revision from status
      platform/chrome: cros_ec_typec: Set Partner PD revision from status
      platform/chrome: cros_ec_typec: Set opmode to PD on SOP connected

Prashant Malani (8):
      platform/chrome: cros_ec_typec: Make disc_done flag partner-only
      platform/chrome: cros_ec_typec: Factor out PD identity parsing
      platform/chrome: cros_ec_typec: Rename discovery struct
      platform/chrome: cros_ec_typec: Register cable
      platform/chrome: cros_ec_typec: Store cable plug type
      platform/chrome: cros_ec_typec: Set partner num_altmodes
      platform/chrome: cros_ec_typec: Register SOP' cable plug
      platform/chrome: cros_ec_typec: Register plug altmodes

Utkarsh Patel (2):
      platform/chrome: cros_ec_typec: Parameterize cros_typec_cmds_supporte=
d()
      platform/chrome: cros_ec_typec: Send mux configuration acknowledgment=
 to EC

 drivers/platform/chrome/cros_ec_typec.c        | 269 +++++++++++++++++++++=
----
 include/linux/platform_data/cros_ec_commands.h |  17 ++
 2 files changed, 243 insertions(+), 43 deletions(-)

Thanks so much!
Benson
--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--C9BBXJRw27joBAeF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCYBkH6wAKCRBzbaomhzOw
wj1lAQDnRgRncRPJhHWmERmpxnQFxE3azjZ9cWS8RO4t/WM3FwD/QCydiGm66QIw
jykhYBCWv3N9Qea6EuReeRWHOlrS0g8=
=s5kQ
-----END PGP SIGNATURE-----

--C9BBXJRw27joBAeF--
