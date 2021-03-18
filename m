Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC5233FFF8
	for <lists+linux-usb@lfdr.de>; Thu, 18 Mar 2021 07:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbhCRG4T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Mar 2021 02:56:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbhCRG4J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Mar 2021 02:56:09 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF5CC06175F
        for <linux-usb@vger.kernel.org>; Wed, 17 Mar 2021 23:56:08 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id w2so20932591qts.18
        for <linux-usb@vger.kernel.org>; Wed, 17 Mar 2021 23:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=8f2GKIzq0FyXnU+AW5A6Hbsc9cchKFSkjsCGCUulBbg=;
        b=ZRkpKE8YKlxqollKBzPwMKOT/KrbDPDRJmSo0mf4L+3SY19Q2tUxE2fuYYSkQ1Tom+
         A9LdKsBLmnyq3t2SuWaz3P6t1g40m5SqcAfNuisDOREHLY3IJ0whhNYyIPS6G+qszLFs
         OX0uJbD4k5QzTube3BYADfDrWFq8h6LgdTiz+rTKI0sRZfXHP1GbBHu4p8y+OPqMVRPv
         txzKOGz8BszMhbD99/V90BOlRmeYH2hLUH1+ZhlwzlpWdcnLiidWrSqPKF2xF78eMj61
         3JAs04Z2DCjv1lbhddcFVpR80yQgcidQFw3COpH69HwuVXZIV9E+N8qKabalRgfe9ErG
         XtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=8f2GKIzq0FyXnU+AW5A6Hbsc9cchKFSkjsCGCUulBbg=;
        b=NRFBRm8ALMSxX7jXzofO7cYlBAwPePwaJloF5hmkD04Mm9DG0TuFIOUU0yP3oYpcPo
         hty/mDrNkS08UBbATVJfLxO0Hgjf33zCk5vQr9vPVFkvN3VuY7/Gj5zJjh4wwHPEb1pn
         FLNYbAitFLgo+sRD+u8hXtCyLtpECB6xrL+VDL/ww+w3hgSuuoIvNTq2Yw3SwIu1nKvh
         nROEIC/35LiO2NUylFAk6aCU1odwGGMrRG+iK7cJfsrimpcap0/3eQJxW4izjbSzAl/2
         WnCeu+V/5pahudZ/J2mRMzc6icOtJ4OiD7U/2jEUx59CN2TFrWeMzicwIrWJmxlVJ5UE
         YL0A==
X-Gm-Message-State: AOAM533g6ROG7l/sPZ/VKq+F5P4r4nwPRDYGrXU65mdzMtcIDmHnYr27
        5lpXKSvin5/NxtRe2gTXnC3r3vJ4wQc=
X-Google-Smtp-Source: ABdhPJwID5JSZRpH++dmHrQCCtYndEsNQ3noTjTwvmWJjtYt9E0zIU7GHrT3N24cevBCgwwXtw/U+8xg0yA=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:dc6b:2250:2aa4:b316])
 (user=badhri job=sendgmr) by 2002:a05:6214:20a1:: with SMTP id
 1mr2870609qvd.30.1616050567713; Wed, 17 Mar 2021 23:56:07 -0700 (PDT)
Date:   Wed, 17 Mar 2021 23:56:04 -0700
Message-Id: <20210318065604.3757307-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [PATCH v1] usb: typec: tcpm: PD3.0 sinks can send Discover Identity
 even in device mode
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From 6.4.4.2 Structured VDM:
=E2=80=A2 Either Port May be an Initiator of Structured VDMs except for the=
 Enter
Mode and Exit Mode Commands which Shall only be initiated by the DFP."

The above implies that when PD3.0 link is established PD3.0 sinks
can send out discover identity command/AMS once PD negotiation is done.
This allows discovering identity for PD3.0 UFP ports as well.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 11d0c40bc47d..410856ec1702 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -3653,8 +3653,8 @@ static inline enum tcpm_state unattached_state(struct=
 tcpm_port *port)
=20
 static void tcpm_check_send_discover(struct tcpm_port *port)
 {
-	if (port->data_role =3D=3D TYPEC_HOST && port->send_discover &&
-	    port->pd_capable)
+	if ((port->data_role =3D=3D TYPEC_HOST || port->negotiated_rev > PD_REV20=
) &&
+	    port->send_discover && port->pd_capable)
 		tcpm_send_vdm(port, USB_SID_PD, CMD_DISCOVER_IDENT, NULL, 0);
 	port->send_discover =3D false;
 }
--=20
2.31.0.rc2.261.g7f71774620-goog

