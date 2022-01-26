Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDB8349C8DE
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 12:42:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240836AbiAZLmX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 06:42:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240843AbiAZLmW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jan 2022 06:42:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42671C06161C
        for <linux-usb@vger.kernel.org>; Wed, 26 Jan 2022 03:42:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 099E3B81CB8
        for <linux-usb@vger.kernel.org>; Wed, 26 Jan 2022 11:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5FADC340E5
        for <linux-usb@vger.kernel.org>; Wed, 26 Jan 2022 11:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643197339;
        bh=2FaaWgeTc8Gqsa0aQqa9sVmVW5K6EfEnpznm7Fqff60=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VwznaVbnZ+Z+uzzc2g2Ll7FJw05n2XFoJSzbPq37NzFCWtAmfnojd7+qHeRj98I/R
         qLci1YtHXkJYxBndHaghql9qZJjBOQT385MXLr5LvM+zOQEjO2a1fz6APnoJXRUx1t
         syI8tpluci0qa/phJN4Q+xyitXHkee1a0MI7e0ji4DJmWmbHORSuvfyizgk/+0wfEe
         89cP8oUCYxpmG0SH0hvAkrrvygavcOmXJWRzWmjUlnhxLZG2VQl3t5daZDsh9wt216
         aygpI3eJZ60O9lHenv3wBgv5RUzCHMqhVHuFfl7gcvlb++K+g+je5oL/+kuX7/vCK0
         CjDXV6kQgCBBg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A3847CC13AA; Wed, 26 Jan 2022 11:42:19 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215530] typec kernel error
Date:   Wed, 26 Jan 2022 11:42:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hi2@n101n.xyz
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215530-208809-WFbfBDKRXC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215530-208809@https.bugzilla.kernel.org/>
References: <bug-215530-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215530

--- Comment #5 from neoe (hi2@n101n.xyz) ---
diff --git a/drivers/usb/typec/port-mapper.c b/drivers/usb/typec/port-mappe=
r.c
index 07d307418b470..b6e0c6acc628c 100644
--- a/drivers/usb/typec/port-mapper.c
+++ b/drivers/usb/typec/port-mapper.c
@@ -56,6 +56,9 @@ int typec_link_ports(struct typec_port *con)
 {
        struct each_port_arg arg =3D { .port =3D con, .match =3D NULL };

+       if (!has_acpi_companion(&con->dev))
+               return 0;
+
        bus_for_each_dev(&acpi_bus_type, NULL, &arg, typec_port_match);

        /*
@@ -74,5 +77,6 @@ int typec_link_ports(struct typec_port *con)

 void typec_unlink_ports(struct typec_port *con)
 {
-       component_master_del(&con->dev, &typec_aggregate_ops);
+       if (has_acpi_companion(&con->dev))
+               component_master_del(&con->dev, &typec_aggregate_ops);
 }

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
