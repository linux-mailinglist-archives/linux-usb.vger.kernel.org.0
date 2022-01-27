Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5776149E6A5
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jan 2022 16:50:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243222AbiA0Puv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jan 2022 10:50:51 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:44420 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242857AbiA0Puu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jan 2022 10:50:50 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D3AB4B8013C
        for <linux-usb@vger.kernel.org>; Thu, 27 Jan 2022 15:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CEC2C340EB
        for <linux-usb@vger.kernel.org>; Thu, 27 Jan 2022 15:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643298648;
        bh=HxWR5AORA2Qb81TJY6BTV8I4RsUqDK6LYUkd+At/VXk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DaE20O5Bv4DUC68STBkYDVOgVw77YHmhw72XgPa8US0k9H81pg9Xpt+oBG0q7EeTU
         gS+9ShZTx+VqGcTvclEeOM3qXHEyJPqe2TK9/ZZfezYDbYx4CQRKQnPPZ94b2BFS2x
         0lz8PHnFaeEH4jMt1+wWOqbzJWbjlXpnEvmkwUeTb109SIUmP4iqRJ/CM8sNoYehx9
         wB08rUNHapRnnO6F/dsAiEH/yfwypjUzTb1VWoaEhZRgLV/wTCSz9dXXUMhEYNK7S+
         35MD0HFAq3VgBoTJt/N/3X8TqpHmxlR25Cc5MtbtTX1Ii6IeCuL4wb86xdgvHNrOGb
         ZLNaYgsw0MkFw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6F4D3CC13A6; Thu, 27 Jan 2022 15:50:48 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215361] SL-6000 zaurus USB error - 'bad CDC descriptors'
Date:   Thu, 27 Jan 2022 15:50:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: oliver@neukum.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215361-208809-9KLBHJUf2h@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215361-208809@https.bugzilla.kernel.org/>
References: <bug-215361-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215361

--- Comment #11 from Oliver Neukum (oliver@neukum.org) ---
Created attachment 300340
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300340&action=3Dedit
another special case

Please try this patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
