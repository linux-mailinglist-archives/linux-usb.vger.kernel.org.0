Return-Path: <linux-usb+bounces-32198-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7183D13C71
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 16:47:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA6843061145
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 15:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45CC4361671;
	Mon, 12 Jan 2026 15:41:09 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A96B3612EB
	for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 15:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768232467; cv=none; b=FHD2WjVdCfXNEVnfc4uakFvl2YFhxFVOqjoXMBjrfSRaenif+XmziYzs+p1sOnt9vVkaYnlt7wAh/RaZHbxSSO21XHJVLYhbaCEc/GmYb7uoN0kp5tpELcXp9TOcIBC+3tAL0kMyDKox6tOtQOqWHEdaAmyqsJUdQp12L1gXgEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768232467; c=relaxed/simple;
	bh=FgZckKgLYHGjtv6/NBQMT5GtAWCPYfhwJJopQUEK65s=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PGm+v+7TxdAhT6uWEnOTQnoydhlepKSac9PdIvoVpck3t+6NFM0QmdIKBRBbidH2K7KbLqTNH3sH3GTAhq5jqvOowcegFSeFP46qqc9izgEGps8ElaueMgfNCc7QK+d8NDDBr9XY4C2CRDosPC8kZFn9cWbp6bZz2ajgp/8t2/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-65f6588abf4so9221686eaf.1
        for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 07:41:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768232462; x=1768837262;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+G/GCr1sCg+Fg/ezzZe7hwicncEgSlnhxWk+P+OtI0=;
        b=k7Loqa0Fz5+hv0xP7br+lMNPRC/Wg62BoY0799kkHaOraE9PFr826BT0sQzolmR1En
         VRkRaLG/9T1fiOC/nuO/ZD25Zw9MNeRJL/yfDbOfn4IjjOVFwCfUJtUwHSfZfGQmpjRN
         YthjLhYIUJtoHaZpNFDTetH0sWd2cdcNISASDk9B+GyzeV5yhqzXRjr8UfSq32jsVMPh
         wTsfFRmObBdlv2qNuztYD9iuPTgUmpwybhHEPPvWKfLMA+sTZ7Z8B/GCfYGY7QFGiZBA
         +0rdy9kipNRYJFelUCnhzPnRPy4yzFF9keua0fx6XtYKMIxa4Pa7P9B8IsdcK3KpxT7/
         ToUw==
X-Forwarded-Encrypted: i=1; AJvYcCVM9ewUqDx3hKXToH2IQBJDNNDwesNJD6MtdGRO+GzKXQNTGKrYhtRU4PuEWQM5gbuFz7S0HmdhvZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJyFpI4Jme2RhbBKS+PISM5U5ddpKdic/mnKZ8e1imYajsmesy
	hoDAjNLFZI7WECHCaii8QjtN1JMqkCsLjGZLYSeVnOQqV2Dy65CVuJR9MxDyJPJTC+yFLLK83AP
	kG5aczyZ8Lu8B4deUDlYU52A6+iHve7tIj9UbQXwVDvFKO/T/gpDZUbEWb7I=
X-Google-Smtp-Source: AGHT+IEaVMSy0zqNTMQcjnKZ4awB5Nv2CLXoHYR5+rrCX8aVmJrwxlnlE3PO2qwfjAjecHPjxAzPO0Wx3B1iZeJYy/SywPfqhUxC
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1629:b0:65f:6628:94f5 with SMTP id
 006d021491bc7-65f66289984mr6578232eaf.49.1768232462075; Mon, 12 Jan 2026
 07:41:02 -0800 (PST)
Date: Mon, 12 Jan 2026 07:41:02 -0800
In-Reply-To: <04184aa1-0a74-4247-b618-0390108558cc@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6965160e.050a0220.eaf7.00b1.GAE@google.com>
Subject: Re: [syzbot] [usb?] memory leak in es58x_open
From: syzbot <syzbot+e8cb6691a7cf68256cb8@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, oneukum@suse.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

SYZFAIL: failed to recv rpc

SYZFAIL: failed to recv rpc
fd=3D3 want=3D4 recv=3D0 n=3D0 (errno 9: Bad file descriptor)


Warning: Permanently added '10.128.1.250' (ED25519) to the list of known ho=
sts.
2026/01/12 15:39:49 parsed 1 programs
[   39.963494][ T5813] cgroup: Unknown subsys name 'net'
[   40.103368][ T5813] cgroup: Unknown subsys name 'cpuset'
[   40.109916][ T5813] cgroup: Unknown subsys name 'rlimit'
Setting up swapspace version 1, size =3D 127995904 bytes
[   48.347269][ T5813] Adding 124996k swap on ./swap-file.  Priority:0 exte=
nts:1 across:124996k=20
[   49.687016][ T5833] soft_limit_in_bytes is deprecated and will be remove=
d. Please report your usecase to linux-mm@kvack.org if you depend on this f=
unctionality.
[   49.785190][   T50] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[   49.793415][   T50] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[   49.801131][   T50] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[   49.808915][   T50] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[   49.817199][   T50] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[   50.057495][ T5862] chnl_net:caif_netlink_parms(): no params data found
[   50.132087][ T5862] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   50.139201][ T5862] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   50.146327][ T5862] bridge_slave_0: entered allmulticast mode
[   50.152825][ T5862] bridge_slave_0: entered promiscuous mode
[   50.160009][ T5862] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   50.167192][ T5862] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   50.174469][ T5862] bridge_slave_1: entered allmulticast mode
[   50.180779][ T5862] bridge_slave_1: entered promiscuous mode
[   50.198949][ T5862] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[   50.210355][ T3872] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   50.242429][ T3872] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   50.256034][ T5862] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[   50.305124][ T5862] team0: Port device team_slave_0 added
[   50.311524][ T5862] team0: Port device team_slave_1 added
[   50.353622][ T3872] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   50.372727][ T5862] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[   50.379702][ T5862] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   50.382412][ T3872] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   50.422457][ T5862] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[   50.443561][ T5862] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[   50.450530][ T5862] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   50.479376][ T5862] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[   50.520286][ T5862] hsr_slave_0: entered promiscuous mode
[   50.528206][ T5862] hsr_slave_1: entered promiscuous mode
[   50.575270][ T5862] netdevsim netdevsim1 netdevsim0: renamed from eth0
[   50.583434][ T5862] netdevsim netdevsim1 netdevsim1: renamed from eth1
[   50.593529][ T5862] netdevsim netdevsim1 netdevsim2: renamed from eth2
[   50.601231][ T5862] netdevsim netdevsim1 netdevsim3: renamed from eth3
[   50.612864][ T5862] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   50.620170][ T5862] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   50.627441][ T5862] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   50.634675][ T5862] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   50.652277][ T5862] 8021q: adding VLAN 0 to HW filter on device bond0
[   50.662027][ T3872] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   50.669584][ T3872] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   50.678510][ T5862] 8021q: adding VLAN 0 to HW filter on device team0
[   50.687662][   T35] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   50.696353][   T35] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   50.706281][ T3872] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   50.713530][ T3872] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   50.755069][ T5862] 8021q: adding VLAN 0 to HW filter on device batadv0
[   50.770311][ T5862] veth0_vlan: entered promiscuous mode
[   50.778084][ T5862] veth1_vlan: entered promiscuous mode
[   50.789108][ T5862] veth0_macvtap: entered promiscuous mode
[   50.796333][ T5862] veth1_macvtap: entered promiscuous mode
[   50.805818][ T5862] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[   50.815297][ T5862] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[   50.824977][   T66] netdevsim netdevsim1 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   50.834158][   T66] netdevsim netdevsim1 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   50.843049][   T66] netdevsim netdevsim1 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
2026/01/12 15:40:01 executed programs: 0
[   50.851843][   T66] netdevsim netdevsim1 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   50.903025][ T5134] Bluetooth: hci0: unexpected cc 0x0c03 length: 249 > =
1
[   50.910733][ T5134] Bluetooth: hci0: unexpected cc 0x1003 length: 249 > =
9
[   50.918124][ T5134] Bluetooth: hci0: unexpected cc 0x1001 length: 249 > =
9
[   50.926133][ T5134] Bluetooth: hci0: unexpected cc 0x0c23 length: 249 > =
4
[   50.933518][ T5134] Bluetooth: hci0: unexpected cc 0x0c38 length: 249 > =
2
[   50.970628][ T5923] chnl_net:caif_netlink_parms(): no params data found
[   50.989625][ T5923] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   50.997000][ T5923] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   51.004306][ T5923] bridge_slave_0: entered allmulticast mode
[   51.010653][ T5923] bridge_slave_0: entered promiscuous mode
[   51.017676][ T5923] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   51.024890][ T5923] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   51.032192][ T5923] bridge_slave_1: entered allmulticast mode
[   51.038673][ T5923] bridge_slave_1: entered promiscuous mode
[   51.050271][ T5923] bond0: (slave bond_slave_0): Enslaving as an active =
interface with an up link
[   51.060029][ T5923] bond0: (slave bond_slave_1): Enslaving as an active =
interface with an up link
[   51.074182][ T5923] team0: Port device team_slave_0 added
[   51.080381][ T5923] team0: Port device team_slave_1 added
[   51.090562][ T5923] batman_adv: batadv0: Adding interface: batadv_slave_=
0
[   51.097738][ T5923] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_0 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   51.124023][ T5923] batman_adv: batadv0: Not using interface batadv_slav=
e_0 (retrying later): interface not active
[   51.135475][ T5923] batman_adv: batadv0: Adding interface: batadv_slave_=
1
[   51.142668][ T5923] batman_adv: batadv0: The MTU of interface batadv_sla=
ve_1 is too small (1500) to handle the transport of batman-adv packets. Pac=
kets going over this interface will be fragmented on layer2 which could imp=
act the performance. Setting the MTU to 1532 would solve the problem.
[   51.169658][ T5923] batman_adv: batadv0: Not using interface batadv_slav=
e_1 (retrying later): interface not active
[   51.189046][ T5923] hsr_slave_0: entered promiscuous mode
[   51.195147][ T5923] hsr_slave_1: entered promiscuous mode
[   51.201004][ T5923] debugfs: 'hsr0' already exists in 'hsr'
[   51.207042][ T5923] Cannot create hsr debugfs directory
[   51.234064][ T5923] netdevsim netdevsim0 netdevsim0: renamed from eth0
[   51.241753][ T5923] netdevsim netdevsim0 netdevsim1: renamed from eth1
[   51.249447][ T5923] netdevsim netdevsim0 netdevsim2: renamed from eth2
[   51.257093][ T5923] netdevsim netdevsim0 netdevsim3: renamed from eth3
[   51.269460][ T5923] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   51.276582][ T5923] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   51.283826][ T5923] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   51.290841][ T5923] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   51.308368][ T5923] 8021q: adding VLAN 0 to HW filter on device bond0
[   51.316859][   T35] bridge0: port 1(bridge_slave_0) entered disabled sta=
te
[   51.325225][   T35] bridge0: port 2(bridge_slave_1) entered disabled sta=
te
[   51.335401][ T5923] 8021q: adding VLAN 0 to HW filter on device team0
[   51.344297][   T66] bridge0: port 1(bridge_slave_0) entered blocking sta=
te
[   51.351609][   T66] bridge0: port 1(bridge_slave_0) entered forwarding s=
tate
[   51.360918][   T35] bridge0: port 2(bridge_slave_1) entered blocking sta=
te
[   51.368021][   T35] bridge0: port 2(bridge_slave_1) entered forwarding s=
tate
[   51.409057][ T5923] 8021q: adding VLAN 0 to HW filter on device batadv0
[   51.424572][ T5923] veth0_vlan: entered promiscuous mode
[   51.432514][ T5923] veth1_vlan: entered promiscuous mode
[   51.444137][ T5923] veth0_macvtap: entered promiscuous mode
[   51.451047][ T5923] veth1_macvtap: entered promiscuous mode
[   51.460333][ T5923] batman_adv: batadv0: Interface activated: batadv_sla=
ve_0
[   51.469762][ T5923] batman_adv: batadv0: Interface activated: batadv_sla=
ve_1
[   51.479272][ T3872] netdevsim netdevsim0 netdevsim0: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   51.488352][ T3872] netdevsim netdevsim0 netdevsim1: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   51.497509][ T3872] netdevsim netdevsim0 netdevsim2: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   51.506403][ T3872] netdevsim netdevsim0 netdevsim3: set [1, 0] type 2 f=
amily 0 port 6081 - 0
[   51.526202][ T3872] wlan0: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   51.534861][ T3872] wlan0: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
[   51.545823][ T3872] wlan1: Created IBSS using preconfigured BSSID 50:50:=
50:50:50:50
[   51.553870][ T3872] wlan1: Creating new IBSS network, BSSID 50:50:50:50:=
50:50
SYZFAIL: failed to recv rpc
fd=3D3 want=3D4 recv=3D0 n=3D0 (errno 9: Bad file descriptor)


syzkaller build log:
go env (err=3D<nil>)
AR=3D'ar'
CC=3D'gcc'
CGO_CFLAGS=3D'-O2 -g'
CGO_CPPFLAGS=3D''
CGO_CXXFLAGS=3D'-O2 -g'
CGO_ENABLED=3D'1'
CGO_FFLAGS=3D'-O2 -g'
CGO_LDFLAGS=3D'-O2 -g'
CXX=3D'g++'
GCCGO=3D'gccgo'
GO111MODULE=3D'auto'
GOAMD64=3D'v1'
GOARCH=3D'amd64'
GOAUTH=3D'netrc'
GOBIN=3D''
GOCACHE=3D'/syzkaller/.cache/go-build'
GOCACHEPROG=3D''
GODEBUG=3D''
GOENV=3D'/syzkaller/.config/go/env'
GOEXE=3D''
GOEXPERIMENT=3D''
GOFIPS140=3D'off'
GOFLAGS=3D''
GOGCCFLAGS=3D'-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=3D0=
 -ffile-prefix-map=3D/tmp/go-build3306654363=3D/tmp/go-build -gno-record-gc=
c-switches'
GOHOSTARCH=3D'amd64'
GOHOSTOS=3D'linux'
GOINSECURE=3D''
GOMOD=3D'/syzkaller/jobs-2/linux/gopath/src/github.com/google/syzkaller/go.=
mod'
GOMODCACHE=3D'/syzkaller/jobs-2/linux/gopath/pkg/mod'
GONOPROXY=3D''
GONOSUMDB=3D''
GOOS=3D'linux'
GOPATH=3D'/syzkaller/jobs-2/linux/gopath'
GOPRIVATE=3D''
GOPROXY=3D'https://proxy.golang.org,direct'
GOROOT=3D'/usr/local/go'
GOSUMDB=3D'sum.golang.org'
GOTELEMETRY=3D'local'
GOTELEMETRYDIR=3D'/syzkaller/.config/go/telemetry'
GOTMPDIR=3D''
GOTOOLCHAIN=3D'auto'
GOTOOLDIR=3D'/usr/local/go/pkg/tool/linux_amd64'
GOVCS=3D''
GOVERSION=3D'go1.24.4'
GOWORK=3D''
PKG_CONFIG=3D'pkg-config'

git status (err=3D<nil>)
HEAD detached at d6526ea3e
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' -ldflags=3D"-s -w -X github.com/google/syzkaller/pr=
og.GitRevision=3Dd6526ea3e6ad9081c902859bbb80f9f840377cb4 -X github.com/goo=
gle/syzkaller/prog.gitRevisionDate=3D20251126-113115"  ./sys/syz-sysgen | g=
rep -q false || go install -ldflags=3D"-s -w -X github.com/google/syzkaller=
/prog.GitRevision=3Dd6526ea3e6ad9081c902859bbb80f9f840377cb4 -X github.com/=
google/syzkaller/prog.gitRevisionDate=3D20251126-113115"  ./sys/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build -ldflags=3D"-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3Dd6526ea3e6ad9081c902859bbb80f9f840377cb4 -X g=
ithub.com/google/syzkaller/prog.gitRevisionDate=3D20251126-113115"  -o ./bi=
n/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"d6526ea3e6ad9081c902859bbb80f9f840=
377cb4\"
/usr/bin/ld: /tmp/ccZk5Jco.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking
./tools/check-syzos.sh 2>/dev/null



Tested on:

commit:         ea1013c1 Merge tag 'bpf-fixes' of git://git.kernel.org..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dd60836e327fd675=
6
dashboard link: https://syzkaller.appspot.com/bug?extid=3De8cb6691a7cf68256=
cb8
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils=
 for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D122ee5fa5800=
00


