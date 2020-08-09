Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63E6923FEB9
	for <lists+linux-usb@lfdr.de>; Sun,  9 Aug 2020 16:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbgHIOTN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Aug 2020 10:19:13 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:23351 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726070AbgHIOTM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Aug 2020 10:19:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596982750;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=KJfDvNtR06xu5KpjicQMLrqqiKfJr4YyEx0w8epCDm0=;
        b=G9mnyjxhpWCrHhVhwzrTGfDLh8N9q43+cZgkBTJGzn4XhKoJb5MnkiuGuJBllxM4rA155g
        HRhN3DnnnctWAHtm5bg2bPEr3cBDRsZIpsjvz2Ez1JYsDWEoffNOQttbJPzc9lLXWmOacd
        L/rMnCfmwUPgtsbvJIpCJhT+t3w9TW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-HOO6AugkOkWKRujTnEqQew-1; Sun, 09 Aug 2020 10:19:08 -0400
X-MC-Unique: HOO6AugkOkWKRujTnEqQew-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17DFF19200C0;
        Sun,  9 Aug 2020 14:19:07 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-24.ams2.redhat.com [10.36.112.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BDD2A8953D;
        Sun,  9 Aug 2020 14:19:05 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH 0/4] usb: typec: ucsi: Fix various locking issues
Date:   Sun,  9 Aug 2020 16:19:00 +0200
Message-Id: <20200809141904.4317-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki, et al.,

As discussed before here is my fix for the AB BA lock inversion issue
which lockdep found in the ucsi code.

While working on the AB BA fix I added a
WARN_ON(!mutex_is_locked(&ucsi->ppm_lock)) to ucsi_run_command() and
that found me some more unrelated issues of ucsi_run_command() getting
called without the ppm_lock held. This is fixed in the second patch.
This made me realize that the ppm_lock handling should probably just
be pushed down to inside ucsi_run_command() instead of letting the
callers worry about this.

In essence the first 3 patches are all related and all boil down to
push the ppm_lock handling down into ucsi_run_command(), removing the
difference between ucsi_run_command() and ucsi_send_command(). I have
been thinking that we may want to just squash these 3 together. I've
left them as separate patches now as thet document how I go to the
end result after the 3th patch and having them separate might be
easier for reviewing purposes. Let me know if you want a v2 of this
patchset with them squashed into a single "usb: typec: ucsi: Rework
ppm_lock handling" commit (with the commit messages merged).

The 4th patch makes the also already discussed change of holding
con->lock for the entire duration of ucsi_register_port().

Regards,

Hans

