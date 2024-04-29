Return-Path: <linux-usb+bounces-9882-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DF68B566F
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 13:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C510B241AC
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 11:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D713FB9B;
	Mon, 29 Apr 2024 11:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOSuJoec"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287C33FBA3
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 11:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714389849; cv=none; b=Tpekz1r1/t4M9Dr23ZrP9CezgozBvmu7HJhELVHjJkCTdafSIxqMqnZykHnqsWIDI3JV2mNGx9INMgWhLRu3E34zV4YLPjTrgqWKKVeG/ak82i9K0mB94mgUl3bTX491Ndo1Z70h5ZWXlPA4p7OD1MfFPb8310c8H/9YR+bFzIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714389849; c=relaxed/simple;
	bh=F2DQY0rTibaDptZDvLdCTBPwoDdzIiypgHdrEeiTHIg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D5mSx+EWL+pJnezsF+3quvyhbcSIS2zbjIKhTrMYAUrldJUIWjdedDzEHynfhF9Hb4AH3fRumODnrBVLxDeehM1Iwii+h4q3G3aHIap3NkCCC8zAiZctynY/ybSP+dGOiwugjV5zQBqrpRyHa939XFXkyaVylB+KJBju7jaBhrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOSuJoec; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0765C116B1
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 11:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714389848;
	bh=F2DQY0rTibaDptZDvLdCTBPwoDdzIiypgHdrEeiTHIg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iOSuJoechH0IaMqwrbXU+ZzDdC5q+ztgm4pkPOGmzEgjOC5bBIIzavsgLX1GhMQJC
	 24RFIdKZRdHkb+PrDm7cOKb+gzHL+rlxBNqJwHlHmWaJUm2A1V2HodPswVcQPNji5k
	 98eQwTk/8/6MkdcB7GUGY1v+ifAtb3ZqzfgXrWZ+xvaSJp0pw+x/A3pFvYRIYzBp+9
	 3llw8EUG2RTlG2BWLm10K6l+fRLnXBch4Bfax0As4PIFbcW1UQ7wYtMRR6vaMJeQKR
	 4AKZBIpYEbS3GK1M/kCkryLc1SEPKM2YJtlkoxNqpeZeZQKg56PTtV1aIo8Xlcmfa9
	 LAVz+d+09fmhw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B23F9C16A72; Mon, 29 Apr 2024 11:24:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218789] ucsi_acpi USBC000:00: ucsi_acpi_dsm: failed to evaluate
 _DSM 2 in logs
Date: Mon, 29 Apr 2024 11:24:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: heikki.krogerus@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218789-208809-HJ9ApbJ8qv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218789-208809@https.bugzilla.kernel.org/>
References: <bug-218789-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D218789

Heikki Krogerus (heikki.krogerus@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |heikki.krogerus@linux.intel
                   |                            |.com

--- Comment #4 from Heikki Krogerus (heikki.krogerus@linux.intel.com) ---
This looks like a symptom caused by an issue in the EC driver. The complete
error in your dmesg:

...
[   12.563832] ACPI Error: No handler for Region [ECSI] (000000007b8176ee)
[EmbeddedControl] (20230628/evregion-130)
[   12.564906] ACPI Error: Region EmbeddedControl (ID=3D3) has no handler
(20230628/exfldio-261)
[   12.566187] ACPI Error: Aborting method \_SB.UBTC.ECRD due to previous e=
rror
(AE_NOT_EXIST) (20230628/psparse-529)
[   12.567909] ACPI Error: Aborting method \_SB.UBTC._DSM due to previous e=
rror
(AE_NOT_EXIST) (20230628/psparse-529)
[   12.569254] ACPI: \_SB_.UBTC: failed to evaluate _DSM
c298836f-a47c-e411-ad36-631042b5008f (0x6)
[   12.569259] ucsi_acpi USBC000:00: ucsi_acpi_dsm: failed to evaluate _DSM=
 2
...

The handler for the EC operation region is missing, which is very odd, beca=
use
the EC driver (drivers/acpi/ec.c) has clearly been loaded successfully base=
d on
your the same dmesg output.

Can you also attach the acpidump output:

 % acpidump -o my_acpi.dump

The ACPI guys should take a look at this. I think this is to core issue her=
e:
"ACPI Error: Region EmbeddedControl (ID=3D3) has no handler"

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

